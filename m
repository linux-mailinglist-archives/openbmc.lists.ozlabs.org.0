Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1919E9DAAD3
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2024 16:31:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xz3M520dQz3bSZ
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2024 02:31:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732721486;
	cv=none; b=a/UZ2ulnxYHnRhU3amDD49y54BQZot75yERk6rxnQSvKylcSss0U5eqhrkpJiwEoSgLcFT6bHMUQIRt/jDiSabpRs5u6i/26mkVeQeFcEg7fi3i5jRQ42jOPZvy7goj7NtnXSYbXM1tQH+GuB2uT+tFFl4+drAqKeMmlxpOTXxwzBH6hJYPZe6S7GEirIACAvDRm82w1heQtHfZJKl1IkX0i33ZZ46uE5tVyLEejrw+TtGHGBJHUokXw4a4wv8902ZSAN63E075n8C9SlndIlFi4r0mExfvIVzPLi3oKf6y4gcZNwqZtKl2/gCvZcWeossPwbtKzvF/lyYamu753Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732721486; c=relaxed/relaxed;
	bh=Ko8Thzqqlnf+CMjlL43PkdUIfc4s3QRvXdXWBn6BQDs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ArJU/ajM6gRu8jgiBn8q3hisgFXvzwxWu3ij9UR2tKxgpkhKQx8Huuj69BLVk4bVaRiRBefv1ztEsxovTTEr376FehdoBAxM4ZA/+fPDvgB1/l7N3V3PF/OommDRw2K69qfZj8LOLtqhCvcaEcv066Vfc+WYKsW7POhU1fDdVtB3xPtTPmkMZXP/TQvjBjqHO2dVuATJkgF3iRWCI1ZuOAC5nXHWMlrE3iecP2ar0HcKzSJxuBlu1srGUfCCZ/CFIALlq2mwg2de2+lkwwewRFx1qf/l92ncnamf/zLzXEUrTqVeVcI7S07RJqq9f1eqhM0P788uf2dBn4Hj9hrYNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=klasgroup.com; dkim=pass (2048-bit key; secure) header.d=klasgroup.com header.i=@klasgroup.com header.a=rsa-sha256 header.s=default header.b=lUbJxNxE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=paul.gildea@klasgroup.com; receiver=lists.ozlabs.org) smtp.mailfrom=klasgroup.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=klasgroup.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=klasgroup.com header.i=@klasgroup.com header.a=rsa-sha256 header.s=default header.b=lUbJxNxE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=klasgroup.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=paul.gildea@klasgroup.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xz3M06dGKz2xjv
	for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2024 02:31:22 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5cece886771so1766295a12.0
        for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2024 07:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=klasgroup.com; s=default; t=1732721478; x=1733326278; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ko8Thzqqlnf+CMjlL43PkdUIfc4s3QRvXdXWBn6BQDs=;
        b=lUbJxNxETB7R6fj/O11pIbinV9t2RkvLLHwZm0B1IOI9t42DO/9l0641fM+VESfyaB
         58nOvvVeSyH75KJ9LWg/Kq3OxechRpyszd0W0zmSNPgleYhHSwgnzMST03IFah8jrbgv
         REHZAsn0ZZ4xaCAqgLqsPZpf7NmOuvy+i3HbLCitRhWJxizRpYIevwi8APe9bZwr9oeb
         DMXXGaAmQhDvgfplO/H1NxFhdq9DgOAc4AoyuZhTP10g/0Amw27z+/itiGWx9D1IqVZY
         wp6mLF/M94qNn4DE0NoX8yw83M6lMxQNNwzwaE6FLbX3A2Q08pU5IbY5IdnDREG3Afl4
         bNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732721478; x=1733326278;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ko8Thzqqlnf+CMjlL43PkdUIfc4s3QRvXdXWBn6BQDs=;
        b=ZDrMUCFpdugIbtmlg4hF/TuG+/htpnYgEk5Eq5Zz5Hg4FhebI4dM/k6l0O4f4kZtAA
         13bfToghk1ja54qXC5Zpw1hZBHAyFrnIs1/F6RgpaUawpWPBN2ZaUGdCY9NjMQbZONWw
         c+d08hufeC3DgMAFL50Sq+ZZV92eQ2mfR92n2ircU6jdThpbkyuUjwJ/jHnhgz0/IeT/
         iq9gq+/wYk8FdjyMSGy67rS+NiwffbEOY9b/hBlm/qh/o19gxTR/p+1Jd+bsJmmI0sWF
         kSbTUOsWWs0ZrXX11pfaNtE/FmlfCnzLkntRI4+9AdEnLb9q6meHW6TBzxqlK1pqcUVI
         cY0Q==
X-Gm-Message-State: AOJu0YyCDL2ypLEG2wschBNEImHmU9lraB2yOblCTylRk9yp8oBW9RZ4
	WDLbj0S3DJwS7QOFWMBKL9EswF+azGBoTGT9qAJnMdeAiQBWC0WGfkEJEYFwT+GaAgMSyjyLcbY
	5UoN5aDU2ryhKwga6+Cj6ThPH3oJAuzwMx+GsRy0zkx4qLcOiKL5kUgXo3818l5X6MP4z4ZJqct
	/FUdBdEdMqh9oCFD6lFgBt86Zh1pJGPiFJd6rFPW8=
X-Gm-Gg: ASbGnctKaUdEj8B4eYBpdfmqYRrOpTJAsBONuxKF8BmyfBLOdUzU7Jgo4GskhjTjFUX
	dZkN4mQG6QjeD6gZdGSPpZfT3xD3TkcSS
X-Google-Smtp-Source: AGHT+IEz2L/QRHHJmSbgdbHI0QQWJZ6+cEnQRChfzGUXULC6jmY6VNTdOoVBzcTOOVj7qcfK351gjBzKqfdlHUuWsdk=
X-Received: by 2002:a05:6402:2546:b0:5d0:7282:6f25 with SMTP id
 4fb4d7f45d1cf-5d080bc7bd3mr3870780a12.6.1732721478330; Wed, 27 Nov 2024
 07:31:18 -0800 (PST)
MIME-Version: 1.0
From: Paul Gildea <Paul.Gildea@klasgroup.com>
Date: Wed, 27 Nov 2024 15:30:54 +0000
Message-ID: <CAAYvRVMG-ae1Z64jHMHUWVdj2wqCzgjRoPYLQj8UtBtq6AS8AA@mail.gmail.com>
Subject: Logging in with certificates issue
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000360bfe0627e6a886"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

--000000000000360bfe0627e6a886
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to log in over HTTPS via certificate with my browser and it
doesn't work. I've followed this setup process and checked that the
verification is correct:

https://gerrit.openbmc.org/plugins/gitiles/openbmc/docs/+/ef6af2726cdd976a6=
d767e569fabd639f8abb6d2/security/TLS-configuration.md

Checking the logs I see this output:

Nov 22 14:35:33 vm3 phosphor-certificate-manager[215]: Certificate install,
> FILEPATH:/tmp/Cert
> s.Adv311/cert.pem
> Nov 22 14:35:33 vm3 systemd[1]: Reloading Start bmcweb server...
> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Check if host is
> running
> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Host is running!
> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Received signal tha=
t
> host is running
> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Change to Host
> State: xyz.openbmc_projec
> t.State.Host.HostState.Running
> Nov 22 14:35:33 vm3 systemd[1]: Reloaded Start bmcweb server.
> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Check if host is
> running
> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Host is running!
> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Received signal tha=
t
> host is running
> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Change to Host
> State: xyz.openbmc_projec
> t.State.Host.HostState.Running
> Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Certificate
> install, FILEPATH:/tmp/Cert
> s.jDVxEN/cert.pem
>
> *Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Error occurred
> during X509_verify_cert**call, checking for known error, ERRCODE:20,
> ERROR_STR:unable to get local issuer certificate*
> Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Certificate
> compareKeys, FILEPATH:/tmp/
> Certs.jDVxEN/cert.pem
> Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Inotify callback t=
o
> update certificate
> properties
> Nov 22 14:36:16 vm3 systemd[1]: Reloading Start bmcweb server...
> Nov 22 14:36:16 vm3 systemd[1]: Reloaded Start bmcweb server.



Noting the error and looking at a build based on old code from a few years
ago I get the same error in the logs, but it does log in with the
certificate anyway.

Reading the code, there looks to be a trusted chain bypass for certain
issues, including this one, but from my understanding this still shouldn't
log in over HTTPS, and the newer behaviour is correct? If so, any idea what
might be wrong?

Thanks,
Paul

--=20




This message is intended solely for the person or entity to which it is=20
addressed and may contain confidential and/or privileged material.=C2=A0=C2=
=A0If you=20
have received this message in error, please send it back to us, immediately=
=20
and permanently delete it,=C2=A0and do not use, copy or disclose the inform=
ation=20
contained in this message or in any attachment.



Klas LTD (Company Number=20
163303) trading as Klas, an Irish private company limited by shares, with=
=20
its registered office at One Kilmainham Square, Dublin 8, Ireland D08 ET1W.





Klas Telecom Inc., a Virginia Corporation with offices at 1101 30th=20
St. NW, Washington, DC 20007.




--000000000000360bfe0627e6a886
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to log in over HTTPS=
 via certificate with my browser and it doesn&#39;t work. I&#39;ve followed=
 this setup process and checked that the verification is correct:</div><div=
><br><a href=3D"https://gerrit.openbmc.org/plugins/gitiles/openbmc/docs/+/e=
f6af2726cdd976a6d767e569fabd639f8abb6d2/security/TLS-configuration.md">http=
s://gerrit.openbmc.org/plugins/gitiles/openbmc/docs/+/ef6af2726cdd976a6d767=
e569fabd639f8abb6d2/security/TLS-configuration.md</a><br><br>Checking the l=
ogs I see this output:<br><br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><font face=3D"monospace">Nov 22 14:35:33 vm3 phosphor-certificate-mana=
ger[215]: Certificate install, FILEPATH:/tmp/Cert<br></font><font face=3D"m=
onospace">s.Adv311/cert.pem<br></font><font face=3D"monospace">Nov 22 14:35=
:33 vm3 systemd[1]: Reloading Start bmcweb server...<br></font><font face=
=3D"monospace">Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Check =
if host is running<br></font><font face=3D"monospace">Nov 22 14:35:33 vm3 p=
hosphor-host-state-manager[367]: Host is running!<br></font><font face=3D"m=
onospace">Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Received si=
gnal that host is running<br></font><font face=3D"monospace">Nov 22 14:35:3=
3 vm3 phosphor-host-state-manager[367]: Change to Host State: xyz.openbmc_p=
rojec<br></font><font face=3D"monospace">t.State.Host.HostState.Running<br>=
</font><font face=3D"monospace">Nov 22 14:35:33 vm3 systemd[1]: Reloaded St=
art bmcweb server.<br></font><font face=3D"monospace">Nov 22 14:35:33 vm3 p=
hosphor-host-state-manager[367]: Check if host is running<br></font><font f=
ace=3D"monospace">Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Hos=
t is running!<br></font><font face=3D"monospace">Nov 22 14:35:33 vm3 phosph=
or-host-state-manager[367]: Received signal that host is running<br></font>=
<font face=3D"monospace">Nov 22 14:35:33 vm3 phosphor-host-state-manager[36=
7]: Change to Host State: xyz.openbmc_projec<br></font><font face=3D"monosp=
ace">t.State.Host.HostState.Running<br></font><font face=3D"monospace">Nov =
22 14:36:16 vm3 phosphor-certificate-manager[216]: Certificate install, FIL=
EPATH:/tmp/Cert<br></font><font face=3D"monospace">s.jDVxEN/cert.pem<br></f=
ont><font face=3D"monospace"><b>Nov 22 14:36:16 vm3 phosphor-certificate-ma=
nager[216]: Error occurred during X509_verify_cert<br></b></font><font face=
=3D"monospace"><b>call, checking for known error, ERRCODE:20, ERROR_STR:una=
ble to get local issuer certificate</b><br></font><font face=3D"monospace">=
Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Certificate compareK=
eys, FILEPATH:/tmp/<br></font><font face=3D"monospace">Certs.jDVxEN/cert.pe=
m<br></font><font face=3D"monospace">Nov 22 14:36:16 vm3 phosphor-certifica=
te-manager[216]: Inotify callback to update certificate<br></font><font fac=
e=3D"monospace">properties<br></font><font face=3D"monospace">Nov 22 14:36:=
16 vm3 systemd[1]: Reloading Start bmcweb server...<br></font><font face=3D=
"monospace">Nov 22 14:36:16 vm3 systemd[1]: Reloaded Start bmcweb server.</=
font></blockquote><div><br></div><br>Noting the error and looking at a buil=
d based on old code from a few years ago I get the same error in the logs, =
but it does log in with the certificate anyway.</div><div><br></div><div>Re=
ading the code, there looks to be a trusted chain bypass for certain issues=
, including this one, but from my understanding this still shouldn&#39;t lo=
g in over HTTPS, and the newer behaviour is correct? If so, any idea what m=
ight be wrong?<br><br>Thanks,</div><div>Paul</div></div>

<br>
<div style=3D"font-size:1.3em"><img src=3D"https://www.klasgroup.com/wp-con=
tent/uploads/2020/11/Klas-Logo-30px.png"></div><div style=3D"font-size:1.3e=
m"><br></div><div style=3D"font-family:Arial,Helvetica,sans-serif"><div sty=
le=3D"font-family:Arial,Helvetica,sans-serif"><span style=3D"font-size:1.3e=
m"><img></span><br><div style=3D"font-family:Arial,Helvetica,sans-serif"><d=
iv dir=3D"ltr" style=3D"color:rgb(34,34,34);background-color:rgb(255,255,25=
5)"><font size=3D"1">This message is intended solely for the person or enti=
ty to which it is addressed and may contain confidential and/or privileged =
material.=C2=A0=C2=A0If you have received this message in error, please sen=
d it back to us, immediately and permanently delete it,=C2=A0and do not use=
, copy or disclose the information contained in this message or in any atta=
chment.<br></font></div><div dir=3D"ltr" style=3D"color:rgb(34,34,34);backg=
round-color:rgb(255,255,255)"><div dir=3D"ltr"><font size=3D"1"><br></font>=
</div><div dir=3D"ltr"><font size=3D"1">Klas LTD (Company Number 163303) tr=
ading as Klas, an Irish private company limited by shares, with its registe=
red office at One Kilmainham Square, Dublin 8, Ireland D08 ET1W.<br></font>=
</div><div dir=3D"ltr"><font size=3D"1"><br></font></div><div dir=3D"ltr"><=
/div></div><span style=3D"color:rgb(80,0,80);background-color:rgb(255,255,2=
55)"><div dir=3D"ltr"><font size=3D"1">Klas Telecom Inc., a Virginia Corpor=
ation with offices at 1101 30th St. NW, Washington, DC 20007.</font></div><=
/span></div></div></div>
--000000000000360bfe0627e6a886--
