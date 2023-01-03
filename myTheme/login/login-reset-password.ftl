<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
        <#if section="form">
            <form id="kc-reset-password-form" class="${properties.kcFormClass!} containerReset" action="${url.loginAction}" method="post">
                <div class="logo">
                    <img src="https://smart-webadmin-hml.s3.sa-east-1.amazonaws.com/logo.png" alt="Logo - Technos" />
                </div>
                <h1 class="title">Redefina sua senha</h1>
                <div class="${properties.kcFormGroupClass!} inputContainerReset">
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!} inputStyledReset" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" placeholder="E-mail"/>
                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!} error" aria-live="polite">
                                Por favor, informe o e-mail do usuário.
                            </span>
                        </#if>
                </div>
                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} redButton" type="submit" value="Enviar e-mail de redefinição" />
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}" class="backMsg">
                                ${kcSanitize(msg("backToLogin"))?no_esc}
                            </a></span>
                    </div>
                </div>
            </form>
        </#if>
    </@layout.registrationLayout>