Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E8E31B
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 14:53:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t4NN0LTLzDqSg
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 22:53:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LJn6Z7IX"; 
 dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t4MH3nZ3zDqMV
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 22:52:55 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id s11so4149608otp.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/6bBcfHL9lizq9enzZzxEX6+z7ZiozAQl1UBNS+fthc=;
 b=LJn6Z7IXLS/88K9KY1FA+u6XBRewcM8TVoIvx9vmPd557xb9aVOrzJNRCpFM3YTaoj
 SZehNIy0Dz2XEWxqa2tMYxNPBYGyGj4aEOqGPiCBuh6I3u0tpeq/nIsJduJp1aTibt/x
 tfkKfmRk1P/mcwy6J3LgXup+1l4mTQFyxn8bSrhIRFyI7BvUDcoKjvgLG6Tlm9sitp5L
 BnpWkT5NpNxqhppR262mOK0bp8tW7Vm3vpjtcKodMcFBQL9lflq01YSUKoVngPfPWOWo
 4VkW9LynMAboEcvSP+hWf2a3qkEV4x4uOi3l+Vq+2Vb0U43o0xrLHIcCAoSWGV9QSEeE
 WSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/6bBcfHL9lizq9enzZzxEX6+z7ZiozAQl1UBNS+fthc=;
 b=bhwwGm/aOA0n5/2CW6H5epssr4f3XiyR3MxibgAmJ75J2uMnAGtauKZ2sUsFv3PihC
 SpIaQNXapTFrwfDzyPGxiDcGHTfCTPNIkGGYhO6ZkU3fteWYvVsXWK3r8bZGlXxDI1q0
 IC2OBAvotGUSR6tzJjcn8fLIHngWfESOjbfm3SXkklIIF3qE0Yk/l+RvZIDMz23acALj
 5/vlmw6Lv/T7ut67sZF33t/TWt6AULk+jVZ6qjMvV0I2s7RgWc1Hp9UN3Ewn9dSssawk
 39xaND4tCoWH8TeeBOUfdWnMbDKFbNT/aHiz5XUGICPGwm/DPOtZYRMUmQ8i9/Q8JhoC
 xCaQ==
X-Gm-Message-State: APjAAAWQH4suL2x/QucN7gZvDVsC/KS62S8Hm83pokDPacG0nFimfRgX
 zvzhNOebtm3A0RHPy9+MinjhcxFAxy75+WSsTxttC3yz
X-Google-Smtp-Source: APXvYqy/qrSt6UI2pET/MndveVGWGgxLkRxhQGsg1qBgsp3hhVxwnMbA8gSIco54I05nKYhfCTNTGN1NYouagZU8Xr0=
X-Received: by 2002:a05:6830:12d1:: with SMTP id
 a17mr36895664otq.123.1556542371288; 
 Mon, 29 Apr 2019 05:52:51 -0700 (PDT)
MIME-Version: 1.0
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Mon, 29 Apr 2019 18:22:40 +0530
Message-ID: <CACkAXSq776Nb9Ft9iRqaN0baRqhFQDEwSpwShngnBXoUv=_0_A@mail.gmail.com>
Subject: Secured LDAP Client: Root CA certificate upload process.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001e5ab00587aac318"
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

--0000000000001e5ab00587aac318
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To configure Secured LDAP Client in BMC ,  required a Redfish interface to
upload Server copy of Root CA certificate in BMC for SSL handshaking.

Latest version of DMTF spec (DSP2046 v2018.3 ) certificate supports the
below URIs:

/redfish/v1/AccountService/Accounts/{ManagerAccountId}/Certificates/{Certif=
icateId}

/redfish/v1/AccountService/ActiveDirectory/Certificates/{CertificateId}
/redfish/v1/AccountService/ExternalAccountProviders/{ExternalAccountProvide=
rId}/Certificates/{CertificateId}
 /redfish/v1/AccountService/LDAP/Certificates/{CertificateId}
/redfish/v1/Managers/{ManagerId}/NetworkProtocol/HTTPS/Certificates/{Certif=
icateId}

/redfish/v1/Managers/{ManagerId}/RemoteAccountService/Accounts/{ManagerAcco=
untId}/Certificates/{CertificateId}
 /redfish/v1/Managers/{ManagerId}/RemoteAccountService/ActiveDirectory/Cert=
ificates/{CertificateId}
 /redfish/v1/Managers/{ManagerId}/RemoteAccountService/ExternalAccountProvi=
ders/{ExternalAccountProviderId}/Certificates/{CertificateId}
 /redfish/v1/Managers/{ManagerId}/RemoteAccountService/LDAP/Certificates/{C=
ertificateId}


Currently URI  /redfish/v1/AccountService/LDAP/Certificates/{CertificateId}
used for upload LDAP client certificates.

Ed, Ratan Can we use use any of the existing uri to upload  LDAP server
root CA Certificate , or do we need to introduce custom URI  for this
purpose?

I have already posted question Redfish forum (
https://redfishforum.com/thread/169/certificate-management-ca-upload?page=
=3D1&scrollTo=3D553)
related to general =E2=80=9Cauthority=E2=80=9D type certificate  upload pro=
cess, which can
be used for this purpose.

--0000000000001e5ab00587aac318
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">To configure Secured LDAP Client in BMC ,=
=C2=A0 required a Redfish interface to upload Server copy of Root CA certif=
icate in BMC for SSL handshaking.<br><br>Latest version of DMTF spec (DSP20=
46 v2018.3 ) certificate supports the below URIs: <br><br>/redfish/v1/Accou=
ntService/Accounts/{ManagerAccountId}/Certificates/{CertificateId} <br>/red=
fish/v1/AccountService/ActiveDirectory/Certificates/{CertificateId} <br>/re=
dfish/v1/AccountService/ExternalAccountProviders/{ExternalAccountProviderId=
}/Certificates/{CertificateId}<br>=C2=A0/redfish/v1/AccountService/LDAP/Cer=
tificates/{CertificateId} <br>/redfish/v1/Managers/{ManagerId}/NetworkProto=
col/HTTPS/Certificates/{CertificateId} <br>/redfish/v1/Managers/{ManagerId}=
/RemoteAccountService/Accounts/{ManagerAccountId}/Certificates/{Certificate=
Id}<br>=C2=A0/redfish/v1/Managers/{ManagerId}/RemoteAccountService/ActiveDi=
rectory/Certificates/{CertificateId}<br>=C2=A0/redfish/v1/Managers/{Manager=
Id}/RemoteAccountService/ExternalAccountProviders/{ExternalAccountProviderI=
d}/Certificates/{CertificateId}<br>=C2=A0/redfish/v1/Managers/{ManagerId}/R=
emoteAccountService/LDAP/Certificates/{CertificateId} <br><br>Currently URI=
=C2=A0 /redfish/v1/AccountService/LDAP/Certificates/{CertificateId} used fo=
r upload LDAP client certificates. <br><br>Ed, Ratan Can we use use any of =
the existing uri to upload=C2=A0 LDAP server root CA Certificate , or do we=
 need to introduce custom URI=C2=A0 for this purpose?<br><br>I have already=
 posted question Redfish forum (<a href=3D"https://redfishforum.com/thread/=
169/certificate-management-ca-upload?page=3D1&amp;scrollTo=3D553">https://r=
edfishforum.com/thread/169/certificate-management-ca-upload?page=3D1&amp;sc=
rollTo=3D553</a>) related to general =E2=80=9Cauthority=E2=80=9D type certi=
ficate=C2=A0 upload process, which can be used for this purpose.=C2=A0 <br>=
<br></div></div>

--0000000000001e5ab00587aac318--
