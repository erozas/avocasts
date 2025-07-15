import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    value: String
  }

  connect() {
    console.log(this.valueValue)
  }

  async copy() {
    console.log('Copy method called')
    console.log('Value to copy:', this.valueValue)
    console.log('Value length:', this.valueValue ? this.valueValue.length : 'undefined')

    if (!this.valueValue || this.valueValue.trim() === '') {
      console.error('No value to copy')
      this.showError('No value to copy')
      return
    }

    try {
      await navigator.clipboard.writeText(this.valueValue)
      console.log('Successfully copied to clipboard')
      this.showSuccess("Copied to clipboard!")
    } catch (error) {
      console.error('Failed to copy: ', error)
      this.fallbackCopy()
    }
  }

  fallbackCopy() {
    // Fallback for older browsers or when clipboard API fails
    const textArea = document.createElement('textarea')
    textArea.value = this.valueValue
    textArea.style.position = 'fixed'
    textArea.style.left = '-999999px'
    textArea.style.top = '-999999px'
    document.body.appendChild(textArea)
    textArea.focus()
    textArea.select()

    try {
      document.execCommand('copy')
      this.showSuccess("Copied to clipboard!")
    } catch (error) {
      console.error('Fallback copy failed: ', error)
      this.showError("Failed to copy to clipboard")
    } finally {
      document.body.removeChild(textArea)
    }
  }

  showSuccess(message) {
    // Replace alert with a more user-friendly notification
    const originalText = this.element.querySelector('.copy-feedback')?.textContent || 'Copy link'
    const feedbackElement = this.element.querySelector('.copy-feedback') ||
      this.element.querySelector('[data-copy-feedback]')

    if (feedbackElement) {
      feedbackElement.textContent = '✓ Copied!'
      feedbackElement.classList.add('text-green-600')

      setTimeout(() => {
        feedbackElement.textContent = originalText
        feedbackElement.classList.remove('text-green-600')
      }, 2000)
    }
  }

  showError(message) {
    const feedbackElement = this.element.querySelector('.copy-feedback') ||
      this.element.querySelector('[data-copy-feedback]')

    if (feedbackElement) {
      const originalText = feedbackElement.textContent
      feedbackElement.textContent = '✗ Failed to copy'
      feedbackElement.classList.add('text-red-600')

      setTimeout(() => {
        feedbackElement.textContent = originalText
        feedbackElement.classList.remove('text-red-600')
      }, 2000)
    }
  }
}