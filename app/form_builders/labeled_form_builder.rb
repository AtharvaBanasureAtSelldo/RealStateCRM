class LabeledFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, to: :@template
  %w[text_field number_field].each do |method_name|
    define_method(method_name) do |name,*args|
      options = args.extract_options!.merge(class: "form-control")
      @template.content_tag :div, class: "form-group" do
        label(name,options[:label],class: "form-label") + super(name,*args,options)
      end
    end
  end

  def error_messages
    if object.errors.full_messages.any?
      @template.content_tag(:div, :class => "error_message") do
        @template.content_tag(:h2, "Invalid Fields") +
        @template.content_tag(:ul) do
          object.errors.full_messages.map do |msg|
            @template.content_tag(:li,msg)
          end.join.html_safe
        end
      end
    end
  end
end