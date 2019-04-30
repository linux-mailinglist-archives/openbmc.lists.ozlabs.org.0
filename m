Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234FF55B
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 13:21:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tfHT4TtpzDqT7
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 21:21:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XjIjmzZz"; 
 dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tfGY150xzDqN2
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 21:20:52 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id y64so5364108oia.7
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 04:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=gJtoWbvI5liR1xJX7ehFGtefw/rEsaaHiEePaAOWIfM=;
 b=XjIjmzZzAElwvZWvFlumyOmvMm1Fxh7Z6GVpKq2tvDvrE/A+Ky86oAA1OEroN2scHR
 cg4sEbi6hQqhT0T8nU0wczFNW2/epNzebTbqZXGquNZecbPNsVnxO0fhXbjBImQ23KUa
 BT5VuQeoLCfg9lRYwBKi8oJQVFOUC5ZXiPkw5Jjy0XpVHVoe6ZdD9K2OXzN1hr6XPg2x
 6U7FtJrGrUY8xiGpaPZHvkio+XECYuhd7kO9Aqs05X1ky5PJG/tD4WjoYqKwuLeWXRB0
 42YwCJBUArUo59Mu31V9GF0r/KDwxytzYEmsqru8x1vWAjXENWwfPHBBRsJ+BsyoZht+
 9kVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=gJtoWbvI5liR1xJX7ehFGtefw/rEsaaHiEePaAOWIfM=;
 b=m8FEg6CeuzG2vKdveeIwm6hh3CmuYXvg1eZsKnjo9nUQlx3n7gRwZaNK80cXgbi58q
 D4eXcXLLC72tD32XSCcHzDYVF3jfS96jCffaGq99r4Kp0BGNGuRDNp3AsCS0ZslYL7kq
 wmJBZl2xnQc5Jbp6h9PBjEwhyF5gKBVhdsomMzdp815960qypoVZR0tmKMWovLkhwOtT
 lYft1Zku2YXb5Htxk5nQFYXB/5gNp3k0xQItrFMpRIEzqPnVbO4BgrmscsnImYMV15Ea
 lScujlDMr0QUnUNKP9Cr0Xx4nzjxKByh52t5vCm79tpVzmyxq2TiVBfa59944H2stUG/
 xrXw==
X-Gm-Message-State: APjAAAVcHkrBpdd6aOvuh6Wn74EW19ujs15I+IHeQn1qKE7NlNU1ix36
 OjjML9l42NlYHIBdzCabi3LZf+smOQi3InJPMnLiyrJH
X-Google-Smtp-Source: APXvYqwdYaOzkYv6QcdVzK++pwsyZ3VDyMHxAxzD9ulseonXB0Ae5ohariX9WQxzcrHTt3VDt/YTkL/8aVFkjGGJEEU=
X-Received: by 2002:aca:ebd5:: with SMTP id j204mr2433906oih.173.1556623248597; 
 Tue, 30 Apr 2019 04:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <CACkAXSq776Nb9Ft9iRqaN0baRqhFQDEwSpwShngnBXoUv=_0_A@mail.gmail.com>
In-Reply-To: <CACkAXSq776Nb9Ft9iRqaN0baRqhFQDEwSpwShngnBXoUv=_0_A@mail.gmail.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Tue, 30 Apr 2019 16:50:37 +0530
Message-ID: <CACkAXSrn9gcnxjb9w=_+Hpy3-Vw3FxtbFe+YE8WHMfrGe8Fvrw@mail.gmail.com>
Subject: Re: Secured LDAP Client: Root CA certificate upload process.
To: openbmc@lists.ozlabs.org, ed.tanous@intel.com, 
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>, bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="000000000000c828be0587bd97c8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c828be0587bd97c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Based on the community call discussion team decision is to use new URL for
managing Root CA certificates in general.

The below proposal is based on the existing BMC usecase for uploading
RootCA certificates in common place and Application configure to use this
path for application specific validation purpose.

Note: The below proposal scope is limited Redfish side , Certificate
manager ( backend) implementation  is covered here.

Root CA  Certificate (https://en.wikipedia.org/wiki/Root_certificate)
Upload Proposal:

Design approach: Extend the existing Certificate  schema( DMTF(DSP2046
v2018.3).

Proposed URI  for Root CA certificates : *
/redfish/v1/Managers/{ManagerId}/Truststore/Certificates/{CertificateId} *

*Root CA certificate management Flow:*

Installing new Certificate:

   - The user navigates to the Mangers Certificate Collection that is
   subordinate to the =E2=80=9CTruststore=E2=80=9D object.


   - The user performs a POST on the Certificate collection with the
   certificate string in the body.


Replacing Certificate:

   - Use the existing action #CertificateService.ReplaceCertificate.
      - Note: Most of the user wants to delete the invalid  certificates
      instead of replace.


*Deleting Certificates*
This option is required for deleting invalid/expired/compromised
certificates. Existing CertificateService schema doesn=E2=80=99t support to=
 delete
the installed  certificates. Also  =E2=80=9Cdeletable=E2=80=9D option is di=
sabled ((
deletable=3D false)) in the  CertificateCollection Schema (
https://redfish.dmtf.org/schemas/CertificateCollection.json) .

   - Need to work with Redfish community to add support delete option for
   RootCA certificates.


Looking for the input from the community on the proposed certificate schema
changes to support this feature.

i have already posted question in the Redfish specification forum (
https://redfishforum.com/thread/169/certificate-management-ca-upload?page=
=3D1&scrollTo=3D553)
related to this few months back to understand any work in progress related
to area.

On Mon, Apr 29, 2019 at 6:22 PM Jayanth Othayoth <ojayanth@gmail.com> wrote=
:

> To configure Secured LDAP Client in BMC ,  required a Redfish interface t=
o
> upload Server copy of Root CA certificate in BMC for SSL handshaking.
>
> Latest version of DMTF spec (DSP2046 v2018.3 ) certificate supports the
> below URIs:
>
> /redfish/v1/AccountService/Accounts/{ManagerAccountId}/Certificates/{Cert=
ificateId}
>
> /redfish/v1/AccountService/ActiveDirectory/Certificates/{CertificateId}
>
> /redfish/v1/AccountService/ExternalAccountProviders/{ExternalAccountProvi=
derId}/Certificates/{CertificateId}
>  /redfish/v1/AccountService/LDAP/Certificates/{CertificateId}
> /redfish/v1/Managers/{ManagerId}/NetworkProtocol/HTTPS/Certificates/{Cert=
ificateId}
>
>
> /redfish/v1/Managers/{ManagerId}/RemoteAccountService/Accounts/{ManagerAc=
countId}/Certificates/{CertificateId}
>
>  /redfish/v1/Managers/{ManagerId}/RemoteAccountService/ActiveDirectory/Ce=
rtificates/{CertificateId}
>
>  /redfish/v1/Managers/{ManagerId}/RemoteAccountService/ExternalAccountPro=
viders/{ExternalAccountProviderId}/Certificates/{CertificateId}
>  /redfish/v1/Managers/{ManagerId}/RemoteAccountService/LDAP/Certificates/=
{CertificateId}
>
>
> Currently URI
> /redfish/v1/AccountService/LDAP/Certificates/{CertificateId} used for
> upload LDAP client certificates.
>
> Ed, Ratan Can we use use any of the existing uri to upload  LDAP server
> root CA Certificate , or do we need to introduce custom URI  for this
> purpose?
>
> I have already posted question Redfish forum (
> https://redfishforum.com/thread/169/certificate-management-ca-upload?page=
=3D1&scrollTo=3D553)
> related to general =E2=80=9Cauthority=E2=80=9D type certificate  upload p=
rocess, which can
> be used for this purpose.
>
>

--000000000000c828be0587bd97c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Based on the community call discussion te=
am decision is to use new URL for managing Root CA certificates in general.=
 <br></div><div dir=3D"ltr"><br>The below proposal is based on the existing=
 BMC usecase for uploading RootCA certificates in common place and Applicat=
ion configure to use this path for application specific validation purpose.=
 <br><br>Note: The below proposal scope is limited Redfish side , Certifica=
te manager ( backend) implementation=C2=A0 is covered here.<br><br>Root CA=
=C2=A0 Certificate (<a href=3D"https://en.wikipedia.org/wiki/Root_certifica=
te">https://en.wikipedia.org/wiki/Root_certificate</a>) Upload Proposal:<br=
><br>Design approach: Extend the existing Certificate=C2=A0 schema( DMTF(DS=
P2046 v2018.3).<br><br>Proposed URI=C2=A0 for Root CA certificates :=C2=A0<=
b> /redfish/v1/Managers/{ManagerId}/Truststore/Certificates/{CertificateId}=
 </b><br><br><b>Root CA certificate management Flow:</b><br><br>Installing =
new Certificate:<br><ul><li>The user navigates to the Mangers Certificate C=
ollection that is subordinate to the =E2=80=9CTruststore=E2=80=9D object.</=
li></ul><ul><li>The user performs a POST on the Certificate collection with=
 the certificate string in the body.</li></ul><br>Replacing Certificate:<br=
><ul><li>Use the existing action #CertificateService.ReplaceCertificate.</l=
i><ul><li>Note: Most of the user wants to delete the invalid=C2=A0 certific=
ates instead of replace.=C2=A0 <br></li></ul></ul><br><b>Deleting Certifica=
tes</b></div><div dir=3D"ltr">This option is required for deleting invalid/=
expired/compromised=C2=A0 certificates. Existing CertificateService schema =
doesn=E2=80=99t support to delete the installed=C2=A0 certificates. Also=C2=
=A0 =E2=80=9Cdeletable=E2=80=9D option is disabled (( deletable=3D false)) =
in the=C2=A0 CertificateCollection Schema (<a href=3D"https://redfish.dmtf.=
org/schemas/CertificateCollection.json">https://redfish.dmtf.org/schemas/Ce=
rtificateCollection.json</a>) . <br><ul><li>Need to work with Redfish commu=
nity to add support delete option for RootCA certificates. </li></ul></div>=
<div dir=3D"ltr"><br></div><div>Looking for the input from the community on=
 the proposed certificate schema changes to support this feature.<br></div>=
<div><br></div><div dir=3D"ltr"> i have already posted question in the Redf=
ish specification forum=20
(<a href=3D"https://redfishforum.com/thread/169/certificate-management-ca-u=
pload?page=3D1&amp;scrollTo=3D553">https://redfishforum.com/thread/169/cert=
ificate-management-ca-upload?page=3D1&amp;scrollTo=3D553</a>)
 related to this few months back to understand any work in progress=20
related to area. <br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Apr 29, 2019 at 6:22 PM Jayanth Othayoth=
 &lt;<a href=3D"mailto:ojayanth@gmail.com">ojayanth@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr">To configure Secured LDAP Client in BMC ,=C2=A0 require=
d a Redfish interface to upload Server copy of Root CA certificate in BMC f=
or SSL handshaking.<br><br>Latest version of DMTF spec (DSP2046 v2018.3 ) c=
ertificate supports the below URIs: <br><br>/redfish/v1/AccountService/Acco=
unts/{ManagerAccountId}/Certificates/{CertificateId} <br>/redfish/v1/Accoun=
tService/ActiveDirectory/Certificates/{CertificateId} <br>/redfish/v1/Accou=
ntService/ExternalAccountProviders/{ExternalAccountProviderId}/Certificates=
/{CertificateId}<br>=C2=A0/redfish/v1/AccountService/LDAP/Certificates/{Cer=
tificateId} <br>/redfish/v1/Managers/{ManagerId}/NetworkProtocol/HTTPS/Cert=
ificates/{CertificateId} <br>/redfish/v1/Managers/{ManagerId}/RemoteAccount=
Service/Accounts/{ManagerAccountId}/Certificates/{CertificateId}<br>=C2=A0/=
redfish/v1/Managers/{ManagerId}/RemoteAccountService/ActiveDirectory/Certif=
icates/{CertificateId}<br>=C2=A0/redfish/v1/Managers/{ManagerId}/RemoteAcco=
untService/ExternalAccountProviders/{ExternalAccountProviderId}/Certificate=
s/{CertificateId}<br>=C2=A0/redfish/v1/Managers/{ManagerId}/RemoteAccountSe=
rvice/LDAP/Certificates/{CertificateId} <br><br>Currently URI=C2=A0 /redfis=
h/v1/AccountService/LDAP/Certificates/{CertificateId} used for upload LDAP =
client certificates. <br><br>Ed, Ratan Can we use use any of the existing u=
ri to upload=C2=A0 LDAP server root CA Certificate , or do we need to intro=
duce custom URI=C2=A0 for this purpose?<br><br>I have already posted questi=
on Redfish forum (<a href=3D"https://redfishforum.com/thread/169/certificat=
e-management-ca-upload?page=3D1&amp;scrollTo=3D553" target=3D"_blank">https=
://redfishforum.com/thread/169/certificate-management-ca-upload?page=3D1&am=
p;scrollTo=3D553</a>) related to general =E2=80=9Cauthority=E2=80=9D type c=
ertificate=C2=A0 upload process, which can be used for this purpose.=C2=A0 =
<br><br></div></div>
</blockquote></div>

--000000000000c828be0587bd97c8--
