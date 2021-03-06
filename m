Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA88932F849
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 06:04:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsswC5sCnz3dD4
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 16:04:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ftd8cBFO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=ojayanth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ftd8cBFO; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dssvz1f2Lz3cbX
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 16:04:14 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id m25so4924835oie.12
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 21:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/kCQh7luBcS4rpamUrIT40WaNaJKHdo2PppEeeE2f2E=;
 b=ftd8cBFO6uiNan2KJ75kVF076Vd74dL7efOXAHb1A0r18y7pyX1ntxVNH2tMoHmav9
 tk//j8SxUpBxKgYRG2GLKDutyeaUQrFPuehm9q17o5dmhNXzcgsB8S5BNu1vDlqERKmO
 PvJ9t19ZGyqwEv+f//Fif4hGdWkqmTbxwGFxgyZsU9+t/N8pwP0gpMNWNLZXdsZoFPEP
 n6fJEHbkgesZzbTPNwLYAS2jL2WZQPov2oKRsMjx0+PLNd77NmoCJMKi361Wjz8FIq8W
 Poe9Wl0NYQXlLwd0mNQXBee8fJpSjbIETaNsPhcFVX6/d7ZDIV6otuwBrV92qcddfn+Z
 4kNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/kCQh7luBcS4rpamUrIT40WaNaJKHdo2PppEeeE2f2E=;
 b=Wt5CvbmB7WhHqiZxnpKiTHsFLjyzZbnAk1xq3LlgapRlTZHP8gEJPLexjnPn7tOgoQ
 IqwSE8jdOf0EHuTp01fBJvpRAo3pra+Sf2yzV/gZ9s10JVTqacYO8ZcER0Y+0YTysEZe
 w/w28b6owhZ1ru2J1WGZbICALB1jeU5og3kwXM84LNfw+Q6FCBYgMEpvyzWxyirAqsbH
 ASWcY3jnX6P5kSxhyaPy28jsHoUdqadBPcwcggUPaTbiZJIvH30CYvV6mFPM+32wBnIH
 ABoWT6r1N7lzg5ONYni5+mqzbqiMkB37K3bC5vSuSswHoIy0KPZcVq6d5h7jusJ4Pojz
 biwQ==
X-Gm-Message-State: AOAM533JmZTq9cyjdf8nkInrJBY+vl4N9KiylHMF93MQ/VWMHOHNb8dO
 +IKLgALlhkMDcjMgqK+yCyWaR+ufO15sNV/wEc0=
X-Google-Smtp-Source: ABdhPJzRHgKO4YUQIZfjMeLX3Qb2QJ33eEwn/uF7BTyur02hdB45NpifBnQ+IEO9hiF0s8QpPHGCVizkQzeIOqtcNcA=
X-Received: by 2002:aca:4f96:: with SMTP id d144mr9555688oib.155.1615007048733; 
 Fri, 05 Mar 2021 21:04:08 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80qvHZ2HSvmgeLcJ_X5ZYwRDb-6cw6nOKb6qd_9V971FQ@mail.gmail.com>
 <OFE48BADA9.7DEA6041-ON0025868F.008040B6-0025868F.00809E34@notes.na.collabserv.com>
In-Reply-To: <OFE48BADA9.7DEA6041-ON0025868F.008040B6-0025868F.00809E34@notes.na.collabserv.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Sat, 6 Mar 2021 10:33:57 +0530
Message-ID: <CACkAXSoevimwDbWARh9AXLHf7T5muBhQONNcO7eWbTJUkwLWvg@mail.gmail.com>
Subject: Re: No option to delete SSL certificates
To: Derick Montague <Derick.Montague@ibm.com>
Content-Type: multipart/alternative; boundary="00000000000073176705bcd72171"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Jayanth Othayoth <ojayanth@in.ibm.com>, Devender Rao <devenrao@in.ibm.com>,
 mohammed.habeeb@inventec.com, gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000073176705bcd72171
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Discussion thread related Root CA certificate managment proposal
https://lists.ozlabs.org/pipermail/openbmc/2019-April/016136.html

*Deleting Certificates*
This option is required for deleting invalid/expired/compromised
certificates. Existing CertificateService schema doesn=E2=80=99t support to=
 delete
the installed  certificates. Also  =E2=80=9Cdeletable=E2=80=9D option is di=
sabled ((
deletable=3D false)) in the  CertificateCollection Schema
(https://redfish.dmtf.org/schemas/CertificateCollection.json) .

When we discussed during 2Q 2019  with DMTF, no certificate schema
available to handle root CA certificates.
DMTF was ok to extend existing certificate schema to support Root CA (
see proposal for details) till the Root CA schema is available.




On Sat, Mar 6, 2021 at 4:55 AM Derick Montague <Derick.Montague@ibm.com>
wrote:

>
> > I can't explain why the TrustStore certificate isn't deletable, that
> seems like a bug in webui-vue.
>
> That is the only certificate type that can be deleted.
>
>
> https://github.com/openbmc/webui-vue/blob/d6752694d31362bd42c3cbb51a35d36=
fa2bc25e1/src/views/AccessControl/SslCertificates/SslCertificates.vue#L179-=
L184
>
>

--00000000000073176705bcd72171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Discussion thread related Root CA cert=
ificate managment proposal <a href=3D"https://lists.ozlabs.org/pipermail/op=
enbmc/2019-April/016136.html">https://lists.ozlabs.org/pipermail/openbmc/20=
19-April/016136.html</a></div><div><pre>*Deleting Certificates*
This option is required for deleting invalid/expired/compromised
certificates. Existing CertificateService schema doesn=E2=80=99t support to=
 delete
the installed  certificates. Also  =E2=80=9Cdeletable=E2=80=9D option is di=
sabled ((
deletable=3D false)) in the  CertificateCollection Schema (
<a href=3D"https://redfish.dmtf.org/schemas/CertificateCollection.json">htt=
ps://redfish.dmtf.org/schemas/CertificateCollection.json</a>) .<br><br></pr=
e><pre>When we discussed during 2Q 2019  with DMTF, no certificate schema a=
vailable to handle root CA certificates. <br>DMTF was ok to extend existing=
 certificate schema to support Root CA ( see proposal for details) till the=
 Root CA schema is available.<br><br></pre><pre><br></pre><pre><br></pre></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sat, Mar 6, 2021 at 4:55 AM Derick Montague &lt;<a href=3D"mailto:De=
rick.Montague@ibm.com">Derick.Montague@ibm.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br>
&gt; I can&#39;t explain why the TrustStore certificate isn&#39;t deletable=
, that seems like a bug in webui-vue.=C2=A0 <br>
<br>
That is the only certificate type that can be deleted.<br>
<br>
<a href=3D"https://github.com/openbmc/webui-vue/blob/d6752694d31362bd42c3cb=
b51a35d36fa2bc25e1/src/views/AccessControl/SslCertificates/SslCertificates.=
vue#L179-L184" rel=3D"noreferrer" target=3D"_blank">https://github.com/open=
bmc/webui-vue/blob/d6752694d31362bd42c3cbb51a35d36fa2bc25e1/src/views/Acces=
sControl/SslCertificates/SslCertificates.vue#L179-L184</a><br>
<br>
</blockquote></div>

--00000000000073176705bcd72171--
