# frozen_string_literal: true

module ViewFieldsHelper
  def form_field(form, label_name, input_block)
    render "application/form_field", form: form, label_name: label_name, input_block: input_block
  end

  def show_field(label_text, text_block)
    render "application/show_field", label_text: label_text, text_block: text_block
  end
end
