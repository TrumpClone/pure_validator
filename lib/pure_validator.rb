require 'i18n'
require 'pure_validator/core_extensions/class_attribute'
require 'pure_validator/core_extensions/humanize'
require 'pure_validator/concern'
require 'pure_validator/version'
require 'pure_validator/errors'
require 'pure_validator/args_validator'
require 'pure_validator/validator'
require 'pure_validator/i18n'
require 'pure_validator/validators'
require 'pure_validator/validation_errors'

module PureValidator
  @@validators = {}

  # Returns list of defined validators
  def self.validators
    @@validators
  end

  # Adds new validator to PureValidator
  # @param validator_name [Symbol] validator name
  # @param validator      [.validate, .validation_options] validator
  def self.add_validator(validator_name, validator)
    @@validators[validator_name] = validator
  end
end

PureValidator.add_validator(:email,        PureValidator::Validators::EmailValidator)
PureValidator.add_validator(:exclusion,    PureValidator::Validators::ExclusionValidator)
PureValidator.add_validator(:inclusion,    PureValidator::Validators::InclusionValidator)
PureValidator.add_validator(:length,       PureValidator::Validators::LengthValidator)
PureValidator.add_validator(:numericality, PureValidator::Validators::NumericalityValidator)
PureValidator.add_validator(:presence,     PureValidator::Validators::PresenceValidator)
PureValidator.add_validator(:not_blank,    PureValidator::Validators::PresenceValidator)
PureValidator.add_validator(:not_nil,      PureValidator::Validators::NotNilValidator)
PureValidator.add_validator(:regexp,       PureValidator::Validators::RegexpValidator)
PureValidator.add_validator(:url,          PureValidator::Validators::UrlValidator)

# I18n settings
I18n.load_path += Dir[File.dirname(__FILE__) +'/pure_validator/locales/*.yml']
I18n.default_locale = :en
I18n.reload!
