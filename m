Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F89DB2B4
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2024 07:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzQng3vjgz3bM7
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2024 17:07:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c2f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732774036;
	cv=none; b=KYdG+VtEdRfihZvy8tkyQHqFQZOhsmZg9KsSXXFbu6G+24BdJRN9P9gVdBd/nghUxN1yXmp292e2BToA5wqISShFJ8FY2DmGWjpiKsTnqOGk5iSkqpfSDQHGIy2EOi4vbvYOhiOo+PRJTqDGeXGs0S6au/xeGbAYRPLK6ZmMZ2jzvw36JCv01ggcvt/+mLbk5gatOsuB4hW2pU0ArERCwwa2WGfNNRKn8T1dLvLE6jFfuUJdI1cytMmVqGEFDoZJxFeDZ01nQwqLusrL6UMHfx/JG+iwmgkrrj3swfXh77l6Y+N9nErJzessPrdXEGCtydIDcapkUFFhCwa+j8oX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732774036; c=relaxed/relaxed;
	bh=1E/rD/+zzdOF3JlgUs0sjhSQG1L0dzjl0VfFf2I6Ho8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9/JABBTa4kXWtQXHV555R4Kgf9KGGorUgtTeI62eQLFaHjzQp5zWfYTaaA8lMyCXFo/L45W6+/LtA5gwLZGRp6lILp9iSNk7VihkILPRK2OBZi5LwIcvEBSzHCnGvCc7KL1ug74hFWp2opSJ6K3ObzaeQ0j0clm+TQMnNsJnq3dq1MMppwn9i6vXA4K19tsSWabhP9S65Kkz9by8/KIqO99Bh2ZgfagFYwX4mfpsqPUjSfRDu1n6rQo9gTQ9mEcCgfE06C3BLWsISrXXvpNS4kHK97N8bBuhp5VsVCnAT6JF6daLYX37CiRzDJwdDzH9NEzFeFhgAz7eZYpDzcOCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GZJQfV0i; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GZJQfV0i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzQnZ19W2z2xvh
	for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2024 17:07:13 +1100 (AEDT)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5f1e73033cbso212440eaf.3
        for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2024 22:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732774028; x=1733378828; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1E/rD/+zzdOF3JlgUs0sjhSQG1L0dzjl0VfFf2I6Ho8=;
        b=GZJQfV0iudX8NNPXQfVEoWMEs2DOXBq6qy3VsGboYt8+YuklStbmv2dfh4zL+NNeKi
         Bbhi0c8PTQYM5EY7V6EeGQki+wPBp9L5o8u4LWirzCVuw9/byMUAlXypFwkmVC+6Lfdb
         nc3ELIC0LBm5M9NmwijwJkIQqCiv+BTqJEIweRFQx2hvLazELQuzX532dkvJ51JPikDq
         WLuwG5VDpKUenKGVA6fNL7Y3ynUpWNT+fwd1q/DBl+l9qXwAhOk6FgIWisQYl8Dym92S
         HOK+lPA2tmaMR5xUGhnmn505sbIJW8HDwSI1a0Ti7u94wqSrM4yLBo29miYqACaeeWm1
         2PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732774028; x=1733378828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E/rD/+zzdOF3JlgUs0sjhSQG1L0dzjl0VfFf2I6Ho8=;
        b=HN7DmMguvnewVt1SMD0KRERiRKTKFyxNa9z2BNRYuht2W4k8Y7u6CQD5GqxO/v3mb7
         VNlV4yPVuL8lX0vpEbCP4jOyfioBbV08TpgthZteRtItlCF9KQlu+8rbmIHNOLr97vL4
         wm16QO57exg9yACqyTxdl13hS4fvCiEJg7qtPYoC6QfeCmQaW4KP7urgH5zn+vFmAuh7
         hWv17ZCrWuu+HZepPrH752v2M6EyFlycaBELUBvwXn02lmnUXRBpa9yPF+73j3nkraLz
         fCgq520NycM78Ll5qAw3mlkE+dDmzTdEq3ql7cTMOWeEs6UsMrBWOk8Z4AwBg22D/4SJ
         um0g==
X-Gm-Message-State: AOJu0Yy+e5hHgti051gz19QWcnzQR34Ayno3N1lxtRHD9EFRDIepSFg/
	vQl76/AIWCkb55z98BfRZrCQdW03WRSaSnRpc9HUgOWn5DZ4pZSgvec6Canjrmjuclvbs/jZETZ
	j4EqbdwqV8lHTO1VVjaQeFqq4/QQ=
X-Gm-Gg: ASbGncuEg1TsZDZM3EJRe6AM5lUOSUJT7UBewyNoIHhMxUJ8AbWqYHoz5wln11byki4
	rWsf3s5Gugr9hz+j2CfqspObEsnCyeA==
X-Google-Smtp-Source: AGHT+IGZ+2yvQW/LQCIwNey+o8Wm3RQvTKsZ6vokpPA5W7/c9hc//Ypk67L0yQyo274NYwssCz4XXN5DwCkEFBoy3mk=
X-Received: by 2002:a05:6820:1896:b0:5ee:56d:69f8 with SMTP id
 006d021491bc7-5f20a2582c1mr5381366eaf.7.1732774028009; Wed, 27 Nov 2024
 22:07:08 -0800 (PST)
MIME-Version: 1.0
References: <CAAYvRVMG-ae1Z64jHMHUWVdj2wqCzgjRoPYLQj8UtBtq6AS8AA@mail.gmail.com>
In-Reply-To: <CAAYvRVMG-ae1Z64jHMHUWVdj2wqCzgjRoPYLQj8UtBtq6AS8AA@mail.gmail.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Thu, 28 Nov 2024 11:36:55 +0530
Message-ID: <CACkAXSrWt1LY1A4ifSUuQT=CQ3c5f-PgG0Ne57e+sFV0m_t0PQ@mail.gmail.com>
Subject: Re: Logging in with certificates issue
To: Paul Gildea <Paul.Gildea@klasgroup.com>
Content-Type: multipart/alternative; boundary="0000000000006a6ee50627f2e47b"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006a6ee50627f2e47b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paul,


   - *Background*: The link
   https://gerrit.openbmc.org/c/openbmc/phosphor-certificate-manager/+/4913=
0
   to the Gerrit review provides context on why the certificate manager all=
ows
   the installation of certificates even when the
   X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT error is encountered.
   - *Current Behavior*: With the latest code, the certificate manager
   permits the installation of certificates with this specific error, and
   BMCweb can use these certificates.

If you have more questions or need clarification, we can discuss here or on
Discord.

On Wed, Nov 27, 2024 at 9:01=E2=80=AFPM Paul Gildea <Paul.Gildea@klasgroup.=
com>
wrote:

> Hi,
>
> I'm trying to log in over HTTPS via certificate with my browser and it
> doesn't work. I've followed this setup process and checked that the
> verification is correct:
>
>
> https://gerrit.openbmc.org/plugins/gitiles/openbmc/docs/+/ef6af2726cdd976=
a6d767e569fabd639f8abb6d2/security/TLS-configuration.md
>
> Checking the logs I see this output:
>
> Nov 22 14:35:33 vm3 phosphor-certificate-manager[215]: Certificate
>> install, FILEPATH:/tmp/Cert
>> s.Adv311/cert.pem
>> Nov 22 14:35:33 vm3 systemd[1]: Reloading Start bmcweb server...
>> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Check if host is
>> running
>> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Host is running!
>> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Received signal
>> that host is running
>> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Change to Host
>> State: xyz.openbmc_projec
>> t.State.Host.HostState.Running
>> Nov 22 14:35:33 vm3 systemd[1]: Reloaded Start bmcweb server.
>> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Check if host is
>> running
>> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Host is running!
>> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Received signal
>> that host is running
>> Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Change to Host
>> State: xyz.openbmc_projec
>> t.State.Host.HostState.Running
>> Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Certificate
>> install, FILEPATH:/tmp/Cert
>> s.jDVxEN/cert.pem
>>
>> *Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Error occurred
>> during X509_verify_cert**call, checking for known error, ERRCODE:20,
>> ERROR_STR:unable to get local issuer certificate*
>> Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Certificate
>> compareKeys, FILEPATH:/tmp/
>> Certs.jDVxEN/cert.pem
>> Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Inotify callback
>> to update certificate
>> properties
>> Nov 22 14:36:16 vm3 systemd[1]: Reloading Start bmcweb server...
>> Nov 22 14:36:16 vm3 systemd[1]: Reloaded Start bmcweb server.
>
>
>
> Noting the error and looking at a build based on old code from a few year=
s
> ago I get the same error in the logs, but it does log in with the
> certificate anyway.
>
> Reading the code, there looks to be a trusted chain bypass for certain
> issues, including this one, but from my understanding this still shouldn'=
t
> log in over HTTPS, and the newer behaviour is correct? If so, any idea wh=
at
> might be wrong?
>
> Thanks,
> Paul
>
>
>
> This message is intended solely for the person or entity to which it is
> addressed and may contain confidential and/or privileged material.  If yo=
u
> have received this message in error, please send it back to us, immediate=
ly
> and permanently delete it, and do not use, copy or disclose the informati=
on
> contained in this message or in any attachment.
>
> Klas LTD (Company Number 163303) trading as Klas, an Irish private compan=
y
> limited by shares, with its registered office at One Kilmainham Square,
> Dublin 8, Ireland D08 ET1W.
>
> Klas Telecom Inc., a Virginia Corporation with offices at 1101 30th St.
> NW, Washington, DC 20007.
>

--0000000000006a6ee50627f2e47b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,33,33);font-family:inherit;fon=
t-size:13.006px">Paul,</span><div><font color=3D"#212121"><span style=3D"fo=
nt-size:13.006px"><br></span></font></div><div><ul style=3D"margin-left:0px=
;padding-left:0px;margin-top:10px;margin-bottom:10px;color:rgb(36,36,36);fo=
nt-size:14px"><li style=3D"list-style-type:disc;margin-left:20px"><strong>B=
ackground</strong>: The link=C2=A0

<span style=3D"color:rgb(34,34,34);font-size:small"><a href=3D"https://gerr=
it.openbmc.org/c/openbmc/phosphor-certificate-manager/+/49130">https://gerr=
it.openbmc.org/c/openbmc/phosphor-certificate-manager/+/49130</a></span>=C2=
=A0 to the Gerrit review provides context on why the certificate manager al=
lows the installation of certificates even when the=C2=A0<code style=3D"ove=
rflow-wrap: break-word;">X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT</code>=C2=A0e=
rror is encountered.</li><li style=3D"list-style-type:disc;margin-left:20px=
"><strong>Current Behavior</strong>: With the latest code, the certificate =
manager permits the installation of certificates with this specific error, =
and BMCweb can use these certificates.</li></ul><p style=3D"margin:0px 0px =
1em;color:rgb(36,36,36);font-size:14px">If you have more questions or need =
clarification, we can discuss here or on Discord.</p></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 27, =
2024 at 9:01=E2=80=AFPM Paul Gildea &lt;<a href=3D"mailto:Paul.Gildea@klasg=
roup.com">Paul.Gildea@klasgroup.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>=
I&#39;m trying to log in over HTTPS via certificate with my browser and it =
doesn&#39;t work. I&#39;ve followed this setup process and checked that the=
 verification is correct:</div><div><br><a href=3D"https://gerrit.openbmc.o=
rg/plugins/gitiles/openbmc/docs/+/ef6af2726cdd976a6d767e569fabd639f8abb6d2/=
security/TLS-configuration.md" target=3D"_blank">https://gerrit.openbmc.org=
/plugins/gitiles/openbmc/docs/+/ef6af2726cdd976a6d767e569fabd639f8abb6d2/se=
curity/TLS-configuration.md</a><br><br>Checking the logs I see this output:=
<br><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><font face=3D"mon=
ospace">Nov 22 14:35:33 vm3 phosphor-certificate-manager[215]: Certificate =
install, FILEPATH:/tmp/Cert<br></font><font face=3D"monospace">s.Adv311/cer=
t.pem<br></font><font face=3D"monospace">Nov 22 14:35:33 vm3 systemd[1]: Re=
loading Start bmcweb server...<br></font><font face=3D"monospace">Nov 22 14=
:35:33 vm3 phosphor-host-state-manager[367]: Check if host is running<br></=
font><font face=3D"monospace">Nov 22 14:35:33 vm3 phosphor-host-state-manag=
er[367]: Host is running!<br></font><font face=3D"monospace">Nov 22 14:35:3=
3 vm3 phosphor-host-state-manager[367]: Received signal that host is runnin=
g<br></font><font face=3D"monospace">Nov 22 14:35:33 vm3 phosphor-host-stat=
e-manager[367]: Change to Host State: xyz.openbmc_projec<br></font><font fa=
ce=3D"monospace">t.State.Host.HostState.Running<br></font><font face=3D"mon=
ospace">Nov 22 14:35:33 vm3 systemd[1]: Reloaded Start bmcweb server.<br></=
font><font face=3D"monospace">Nov 22 14:35:33 vm3 phosphor-host-state-manag=
er[367]: Check if host is running<br></font><font face=3D"monospace">Nov 22=
 14:35:33 vm3 phosphor-host-state-manager[367]: Host is running!<br></font>=
<font face=3D"monospace">Nov 22 14:35:33 vm3 phosphor-host-state-manager[36=
7]: Received signal that host is running<br></font><font face=3D"monospace"=
>Nov 22 14:35:33 vm3 phosphor-host-state-manager[367]: Change to Host State=
: xyz.openbmc_projec<br></font><font face=3D"monospace">t.State.Host.HostSt=
ate.Running<br></font><font face=3D"monospace">Nov 22 14:36:16 vm3 phosphor=
-certificate-manager[216]: Certificate install, FILEPATH:/tmp/Cert<br></fon=
t><font face=3D"monospace">s.jDVxEN/cert.pem<br></font><font face=3D"monosp=
ace"><b>Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Error occurr=
ed during X509_verify_cert<br></b></font><font face=3D"monospace"><b>call, =
checking for known error, ERRCODE:20, ERROR_STR:unable to get local issuer =
certificate</b><br></font><font face=3D"monospace">Nov 22 14:36:16 vm3 phos=
phor-certificate-manager[216]: Certificate compareKeys, FILEPATH:/tmp/<br><=
/font><font face=3D"monospace">Certs.jDVxEN/cert.pem<br></font><font face=
=3D"monospace">Nov 22 14:36:16 vm3 phosphor-certificate-manager[216]: Inoti=
fy callback to update certificate<br></font><font face=3D"monospace">proper=
ties<br></font><font face=3D"monospace">Nov 22 14:36:16 vm3 systemd[1]: Rel=
oading Start bmcweb server...<br></font><font face=3D"monospace">Nov 22 14:=
36:16 vm3 systemd[1]: Reloaded Start bmcweb server.</font></blockquote><div=
><br></div><br>Noting the error and looking at a build based on old code fr=
om a few years ago I get the same error in the logs, but it does log in wit=
h the certificate anyway.</div><div><br></div><div>Reading the code, there =
looks to be a trusted chain bypass for certain issues, including this one, =
but from my understanding this still shouldn&#39;t log in over HTTPS, and t=
he newer behaviour is correct? If so, any idea what might be wrong?<br><br>=
Thanks,</div><div>Paul</div></div>

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
/span></div></div></div></blockquote></div>

--0000000000006a6ee50627f2e47b--
