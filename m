Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971494C9DBD
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 07:25:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7kd94sC2z3bmV
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 17:25:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FrcJMIka;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FrcJMIka; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7kcm0M1tz3bV6
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 17:25:11 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id s14so864480edw.0
 for <openbmc@lists.ozlabs.org>; Tue, 01 Mar 2022 22:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9V41QZrwY9ip9vSyws04SIdSh/2rswMk+I9W2Ep5gJI=;
 b=FrcJMIka23G1u0GEjNcx1CgNnP05AJMn9GF9/gVNk8dWNYhBKTuEJDNAi5Nu3wyiSq
 Arp0wvobtxo2h84y2PLvgrLr2mbH3q3vxIQ/3atXhcEUVnM/DmYslF+QZmtsr1VZJu2A
 u0pveS/ayfx29/jmJjuPIEKvHGkIIdIJHDWN2TOwM/8nW9K3CCcBBlFg1kGuePiAX7ED
 ChQZH+hCmbO1wdMI6shKdYr6xCIYHFQqXKGaRjo5qf3psRY5b2hW3Ott63RVghqs/rGp
 kLlPZcMrHbcuE4905HeSx0fd7Esw5rW0Bq5koaV2tlYKV0hB+PD3bSsV2wy1mj+l1IDv
 5lSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9V41QZrwY9ip9vSyws04SIdSh/2rswMk+I9W2Ep5gJI=;
 b=z3uPe1dMoyzUlfLZRr8UmftIXHfxu2UMWz121nj+GxPWPVp/dacJ8b26EK248E4h/m
 LbHpLsvHlbUmCnfco3J2APE+C9dh3Eud5WIqq9bB8Xan4lD2+y0m0tg/EKX4jsNQoAbw
 cpVqto/FNrs9SchxwpA0yn5L0wrG9oPpB28O3L3tYM9bFxVwalft2wbYY5aoOzZq02oy
 veADigGm4sFYA9M4U/8PXvIeIpCqNrMXXTpXu3zF6XYvNNMpWat5xckWHZ76JBc10exD
 subxj1Hi7mfam8Hl3+bb/57DpQCBbl4PVEzQGxHFT3RqLUowpn13qQLGLcTBSF0hQhTJ
 WEkQ==
X-Gm-Message-State: AOAM531fgJWsHG2Q8ajpJ8uKD3WMuopUI6/iiHBjjaUYh8biYAn4XS1H
 K1OD1EeWHRivCkTPOFz9s7EPXRgZB3hS45DGRdjqThg7
X-Google-Smtp-Source: ABdhPJx7t15DsAIjThdNHltu5OwUqHypy7HRNXwqhI6FMbgPjdzwt+cOgZuQlLowH1aMGvqm2aBmchNYqDW4TJRvsQc=
X-Received: by 2002:a05:6402:268c:b0:411:e086:b7d1 with SMTP id
 w12-20020a056402268c00b00411e086b7d1mr27780603edd.111.1646202307864; Tue, 01
 Mar 2022 22:25:07 -0800 (PST)
MIME-Version: 1.0
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
In-Reply-To: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Wed, 2 Mar 2022 11:54:56 +0530
Message-ID: <CAMhqiMqpoEhph-QCEt7kNPtY10P252SHQbbmGUY_2CLH1c7p2g@mail.gmail.com>
Subject: Re: Checking for network online
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Content-Type: multipart/alternative; boundary="000000000000c9ec1f05d9365702"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c9ec1f05d9365702
Content-Type: text/plain; charset="UTF-8"

Hi Johnathan,

Can you ask this in the systemd community?Any workaround if they can offer.

Ratan



On Fri, Feb 18, 2022 at 4:26 AM Johnathan Mantey <
johnathanx.mantey@intel.com> wrote:

> /I/ntel has recently run into an issue regarding a systemd service, and
> we're interested in soliciting feedback from the community.
>
> Issue: systemd-networkd-wait-online.service stalls for 120 seconds when
> the managed NICs do not have a network connection.
>
> TLDR: Should OpenBMC remove systemd-networkd-wait-online.service
> universally?
>
> System Config: All NICs in the system are not connected to an active
> network.
>
> Test Process: The system under test (SUT) has AC removed, and some time
> later AC applied. Wait for BMC/BIOS to boot
>
> Behavior: U-Boot hands control to the Linux boot process, and the
> systemd services are started. When systemd-networkd-wait-online.service
> starts it stalls waiting for the NICs to enter a fully functional state.
> This never happens during the default 120 second timeout period for this
> service. When the timeout elapses, an error message is logged to the
> journal reporting the service exited unsuccessfully.
>
> Issues: This service blocks entry to multi-user.target.
> phosphor-state-manager uses multi-user.target to report the BMC is ready
> to use.
> This is reported via IPMI Get Device ID.
> The Intel BIOS is blocked from booting until
> systemd-networkd-wait-online times out.
> BMC entry to multi-user.target is delayed. Journal entries are created.
>
> Question for the community: Given the negative side effects caused by
> running this service does the community want to have this service
> collectively removed from global build image?
>
> --
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com
>
>

--000000000000c9ec1f05d9365702
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Johnathan,<div><br></div><div>Can you ask this in the s=
ystemd community?Any workaround if they can offer.</div><div><br></div><div=
>Ratan</div><div><br></div></div><br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Feb 18, 2022 at 4:26 AM Johnathan Ma=
ntey &lt;<a href=3D"mailto:johnathanx.mantey@intel.com">johnathanx.mantey@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">/I/ntel has recently run into an issue regarding a systemd service,=
 and <br>
we&#39;re interested in soliciting feedback from the community.<br>
<br>
Issue: systemd-networkd-wait-online.service stalls for 120 seconds when <br=
>
the managed NICs do not have a network connection.<br>
<br>
TLDR: Should OpenBMC remove systemd-networkd-wait-online.service <br>
universally?<br>
<br>
System Config: All NICs in the system are not connected to an active <br>
network.<br>
<br>
Test Process: The system under test (SUT) has AC removed, and some time <br=
>
later AC applied. Wait for BMC/BIOS to boot<br>
<br>
Behavior: U-Boot hands control to the Linux boot process, and the <br>
systemd services are started. When systemd-networkd-wait-online.service <br=
>
starts it stalls waiting for the NICs to enter a fully functional state. <b=
r>
This never happens during the default 120 second timeout period for this <b=
r>
service. When the timeout elapses, an error message is logged to the <br>
journal reporting the service exited unsuccessfully.<br>
<br>
Issues: This service blocks entry to multi-user.target.<br>
phosphor-state-manager uses multi-user.target to report the BMC is ready <b=
r>
to use.<br>
This is reported via IPMI Get Device ID.<br>
The Intel BIOS is blocked from booting until <br>
systemd-networkd-wait-online times out.<br>
BMC entry to multi-user.target is delayed. Journal entries are created.<br>
<br>
Question for the community: Given the negative side effects caused by <br>
running this service does the community want to have this service <br>
collectively removed from global build image?<br>
<br>
-- <br>
Johnathan Mantey<br>
Senior Software Engineer<br>
*azad te**chnology partners*<br>
Contributing to Technology Innovation since 1992<br>
Phone: (503) 712-6764<br>
Email: <a href=3D"mailto:johnathanx.mantey@intel.com" target=3D"_blank">joh=
nathanx.mantey@intel.com</a><br>
<br>
</blockquote></div>

--000000000000c9ec1f05d9365702--
