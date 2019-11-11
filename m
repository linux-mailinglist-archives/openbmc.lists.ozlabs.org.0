Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122AF7AA4
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 19:20:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BfLF45C0zF3RX
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 05:20:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Lk/VtMgB"; 
 dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bf5m6zTqzDrSL
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 05:09:15 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id k14so12660693eds.4
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GLaufu3C52QVwHTFB99/K4c8sZZVEcPUnXo1hFJ5w9w=;
 b=Lk/VtMgBnEiBF8C2ZYI3Haf+vALaR94eccTdTrEyzzjX2srNgYNnpApSsofdcI6DRx
 4+EFIXeRi9R5yhkPL6Et2VfZ/fRmLqDzRYzCq4ZCj5qQf0iZwr/sl5Ey1CVZhCet2ZYK
 nQ4n/VOeKhUogKDmRM++akzk7TlSCptSbTj3GvWQ3HTuOMoEOT02Q+UjYEj4Iv09y6sF
 0Jfe1jFqmCjoKwhGQyh3X5Pn5ZD1+0nnvrUTaaOajHzO5G8SsXpMwuk2OdlCJXP3SaZW
 krWkhriSnZsTYGeq1GMQvm+sZwC6MyPSCx5eYqDEtKhRYhn2TOWDspxsDnj8Ru9UM6Yi
 RZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GLaufu3C52QVwHTFB99/K4c8sZZVEcPUnXo1hFJ5w9w=;
 b=YMtIRxkzF+zKHnuTSZOJdY+ZsvLFU/kRxkNG9bB+4+X57FVD6HJIeQIkCWCAvLlUMo
 txeuiLTan5uFNr/1uodh6Z0US0X0R1wlqXpdywFa4VJEClKpSJ3u7y5/kNs2gVnxUAyt
 kCAyYWdkE1EhhuGMeY2IbplAFhW1PCEPsDD1vplt3e9FDjn4Z28k8mV+wRadp5vUzgEt
 zvtKa6N6XZmYMMXzAPFlaQP2p+tKifZbpR5z27Umjw9yvGmu/sReG8VClTmN5C14IoPp
 0kK1dgbP89L1TfU+ft+fWeCAmdefNIPwmHeY+OEjiFUNQNAlkotr8tmt69o5kRlDdt3/
 DzqA==
X-Gm-Message-State: APjAAAWhQhtJRPYY5c9ah25oS93Qre+mfOqEmRMWG3xx6VbcXqEZGINp
 zvotNPCX5FL3vJgP5C51iOs3RQzhgwWm5x1McMixwQ==
X-Google-Smtp-Source: APXvYqympxjHP5t2nnzhsX3LlRYt76jOrJWaZDlCUbe7zJF9RUN4WRhKi/PrjbQIG+XnVuiLQFnnac2WTWGJRGLPibw=
X-Received: by 2002:a50:f783:: with SMTP id h3mr27683812edn.168.1573495749804; 
 Mon, 11 Nov 2019 10:09:09 -0800 (PST)
MIME-Version: 1.0
References: <18608ACD-34D8-4408-B0C1-B5185A92CE2B@fuzziesquirrel.com>
In-Reply-To: <18608ACD-34D8-4408-B0C1-B5185A92CE2B@fuzziesquirrel.com>
From: Oskar Senft <osk@google.com>
Date: Mon, 11 Nov 2019 13:08:53 -0500
Message-ID: <CABoTLcQUrCjzbA1qELhug370fKFK6+Gii9ZsF=FX59oYwNRMVg@mail.gmail.com>
Subject: Re: in-band hardware management after IPMI
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000399566059716070f"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "OCP-HWmgt@ocp-all.groups.io" <OCP-HWmgt@ocp-all.groups.io>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000399566059716070f
Content-Type: text/plain; charset="UTF-8"

Hi Brad

At least in my group, we're currently looking into using Redfish over the
USB virtual NIC between host and BMC. The host would be running Linux
(un-virtualized).

Oskar.

On Mon, Nov 11, 2019 at 11:56 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> Hi everyone
>
> This is my first post to the hardware management list.  I'm Brad, I work
> for IBM and I'm the TSC chair of the OpenBMC project.  I've cross posted to
> both the OCP HW management mailing list and the OpenBMC project mailing
> list because I expect both audiences are interested in the discussion.
>
> My question is mostly simple - The answers will likely not be.  I would
> like to know whatever anyone is willing to share about in-band hardware
> management plans in a post-IPMI world.  By in-band I mean applications (or
> firmware) running on host processors in the same server as a BMC.
>
> Will you use Redfish?  PLDM?  A mix?  From host firmware?  From Windows?
> From Linux?  From virtualized OSes?  From un-virtualized OSes?
>
> Thanks!
>
> -brad

--000000000000399566059716070f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Brad<div><br></div><div>At least in my group, we&#39;re=
 currently looking into using Redfish over the USB virtual NIC between host=
 and BMC. The host would be running Linux (un-virtualized).</div><div><br><=
/div><div>Oskar.</div><div></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 11, 2019 at 11:56 AM Brad Bish=
op &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirr=
el.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi everyone<br>
<br>
This is my first post to the hardware management list.=C2=A0 I&#39;m Brad, =
I work for IBM and I&#39;m the TSC chair of the OpenBMC project.=C2=A0 I&#3=
9;ve cross posted to both the OCP HW management mailing list and the OpenBM=
C project mailing list because I expect both audiences are interested in th=
e discussion.<br>
<br>
My question is mostly simple - The answers will likely not be.=C2=A0 I woul=
d like to know whatever anyone is willing to share about in-band hardware m=
anagement plans in a post-IPMI world.=C2=A0 By in-band I mean applications =
(or firmware) running on host processors in the same server as a BMC.<br>
<br>
Will you use Redfish?=C2=A0 PLDM?=C2=A0 A mix?=C2=A0 From host firmware?=C2=
=A0 From Windows?=C2=A0 From Linux?=C2=A0 From virtualized OSes?=C2=A0 From=
 un-virtualized OSes?<br>
<br>
Thanks!<br>
<br>
-brad</blockquote></div>

--000000000000399566059716070f--
