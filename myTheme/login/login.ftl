<#import "template.ftl" as layout>
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#-- <#if section="header">
            <#-- ${msg("loginAccountTitle")} -->
                <#if section="form">
                    <div id="kc-form" class="kc-form">
                        <div id="kc-form-wrapper" class="kc-form-wrapper">
                            <div class="logo">
                                <img src="https://smart-webadmin-hml.s3.sa-east-1.amazonaws.com/logo.png" alt="Logo - Technos" />
                            </div>
                            <h3 class="title">Faça seu Login</h3>
                            <#if realm.password>
                                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                    <#if !usernameHidden??>
                                        <div class="${properties.kcFormGroupClass!} inputContainer">
                                            <input tabindex="1" id="username" class="${properties.kcInputClass!} inputStyled" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" placeholder="E-mail"
                                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                                            <#if messagesPerField.existsError('username','password')>
                                                <span id="input-error" class="${properties.kcInputErrorMessageClass!} error" aria-live="polite">
                                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                                </span>
                                            </#if>
                                        </div>
                                    </#if>
                                    <div class="${properties.kcFormGroupClass!} inputContainer">
                                        <input tabindex="2" id="password" class="${properties.kcInputClass!} inputStyled" name="password" type="password" autocomplete="off" placeholder="Senha"
                                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                                        <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                            <span id="input-error" class="${properties.kcInputErrorMessageClass!} error" aria-live="polite">
                                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                            </span>
                                        </#if>
                                    </div>
                                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                        <div id="kc-form-options">
                                            <#if realm.rememberMe && !usernameHidden??>
                                                <div class="checkbox">
                                                    <label>
                                                        <#if login.rememberMe??>
                                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                                            ${msg("rememberMe")}
                                                            <#else>
                                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
                                                                ${msg("rememberMe")}
                                                        </#if>
                                                    </label>
                                                </div>
                                            </#if>
                                        </div>
                                    </div>
                                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"
                            </#if>/>
                            <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} redButton" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}" />
                            <div class="${properties.kcFormOptionsWrapperClass!} forgetContainer">
                                <#if realm.resetPasswordAllowed>
                                    <span>
                                        <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="forgetPassword">
                                            ${msg("doForgotPassword")}
                                        </a>
                                    </span>
                                </#if>
                            </div>
                        </div>
                        </form>
                </#if>
                </div>
                </div>
                <#elseif section="info">
                    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                        <div id="kc-registration-container">
                            <div id="kc-registration">
                                <span>
                                    ${msg("noAccount")}
                                    <a tabindex="6"
                                        href="${url.registrationUrl}">
                                        ${msg("doRegister")}
                                    </a>
                                </span>
                            </div>
                        </div>
                    </#if>
                    <#elseif section="socialProviders">
                        <#if realm.password && social.providers??>
                            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                                <hr />
                                <h4>
                                    ${msg("identity-provider-login-label")}
                                </h4>
                                <ul class="${properties.kcFormSocialAccountListClass!}
<#if social.providers?size gt 3>
${properties.kcFormSocialAccountListGridClass!}
</#if>">
                                    <#list social.providers as p>
                                        <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!}
<#if social.providers?size gt 3>
${properties.kcFormSocialAccountGridItem!}
</#if> redButton"
                                            type="button" href="${p.loginUrl}">
                                            <#if p.iconClasses?has_content>
                                                <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">
                                                    ${p.displayName!}
                                                </span>
                                                <#else>
                                                    <span class="${properties.kcFormSocialAccountNameClass!}">
                                                        ${p.displayName!}
                                                    </span>
                                            </#if>
                                        </a>
                                    </#list>
                                </ul>
                            </div>
                        </#if>
                        </#if>
    </@layout.registrationLayout>