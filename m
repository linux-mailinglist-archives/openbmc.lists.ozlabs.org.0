Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CEDE73B8
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 15:34:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471y0t5BTKzDrJ7
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 01:34:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ijpWwKK/"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471xzn4gNZzDrGp
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 01:33:55 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id x6so1620836pln.2
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N5S5H1sr4bfu4c5ehS3Lvgva5tnJxahLRW+2VTzbfB8=;
 b=ijpWwKK/xwfKqL/qgB3k0kfm8X7UIgVZ+bK6CYzQYuRYngHOsNOrk5xa/ZIVV9QjHn
 cy5UNMUR4wz9coLYMZP/yqNlzHzRy7QsBwVthfPA6XJ63OwGhIDJ2K+QbVZt3fUz+9L+
 fMQyGspPwcYbfTUrpMmE7BClUXwp8BsRJt+Sjz+awtkXbDCpllWDAvMVgQyYBTPw/wCf
 Hwv/vZz0EY+0linr2Unh/l5oYz+kCaHUlt1SXp+CsWaB2jFzSjC5WvTGXQyLWKDtZD94
 +obfKYjORxG/X5ae6dj5+LGElnde83Sg88CO8KJ21XmhfAp6feRxWScrS13DVtC/6cM6
 UySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N5S5H1sr4bfu4c5ehS3Lvgva5tnJxahLRW+2VTzbfB8=;
 b=lkWXvsjO+G2w7E10Xj3rLlIx8eW/JpK5/6jWSPBp6+PMjvOC0sXpAytne5xO1TGAMZ
 tVIWrl3uaSYqDFQSz64J9sIzpjUxV6z0vNntvYIZWaqKWrDjETfU2J0m2hFYgQLNxXHE
 3ixs71K1EVHcNqUutOEju/Nb3woqrzIK+Z0bakRmrBUztIbJqqsqBBE2hDwpHFhG/Zww
 3O7ALMCkEzW0KJn+ujEwRjcbbHdUPW4SboZRtrlNB3HwLzbGMnlAmWr6LAq2t96qEZlF
 nYJRi5NJw3BxQIXQmsK/uUjpIxAbL6TSaer754BCK39PzyaekOpiUfFwzFyqWHSSRi38
 DqXQ==
X-Gm-Message-State: APjAAAWQbAHLE3XbemSTua8csjPedKFuflzc/OnbUpbMszN+SkYTAFtj
 xf3hsTAEXg/9LWJVrSe5P+HpMi+qQtUQWOAQE0Gmaw==
X-Google-Smtp-Source: APXvYqx4nRCV4tKpRics5DP6Xeh+J9RO/nz/E3ZdNOVR6NKlrhP6jKopTCPpsceMEdWEZU4la6HFdtb0OcX6oe6SiBU=
X-Received: by 2002:a17:902:9b83:: with SMTP id
 y3mr18969741plp.179.1572273231271; 
 Mon, 28 Oct 2019 07:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR02MB3348A12C43559ED44AA67D149F660@HK0PR02MB3348.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB3348A12C43559ED44AA67D149F660@HK0PR02MB3348.apcprd02.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 28 Oct 2019 07:33:40 -0700
Message-ID: <CAO=notxVxud5HxTuDnjH46Ew=JtXVydVK0d27w44MEigyL00ig@mail.gmail.com>
Subject: Re: How to use phosphor-ipmi-flash
To: "Bright Cheng/WYHQ/Wiwynn" <Bright_Cheng@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 28, 2019 at 2:32 AM Bright Cheng/WYHQ/Wiwynn
<Bright_Cheng@wiwynn.com> wrote:
>
> Hi all,
>
>
>
> I installed phosphor-ipmi-flash, phosphor-ipmi-blob and ipmi-blob-tool in=
 BMC and tried host-tool in Linux to update via ipmilpc.
>
>
>
> Following are command and its response:
>
> # ./burn_my_bmc --command update --interface ipmilpc --image /root/obmc-i=
mage/image-bmc --sig /root/obmc-image/image-bmc.sig --type static --ignore-=
update --address 0x1 --length 1024
>
> /flash/static not found
>
>
>
> Should I add =E2=80=9C/flash/static=E2=80=9D to <<config-static-bmc.json.=
in>> for getting this =E2=80=9C/flash/static=E2=80=9D blob?
>
> If yes, how to set <<config-static-bmc.json.in>> if I want to update BMC =
via ipmilpc?

Both of these questions really point to the BMC's configuration --
what is your recipe configuring?  For instance:

PACKAGECONFIG_append_fakesystem =3D " aspeed-p2a reboot-update static-bmc"
IPMI_FLASH_BMC_ADDRESS_fakesystem =3D "0x47FF0000"

Will enable the aspeed-p2a controller, reboot-update and enable the
config-static-bmc.json file.

You can find the list of currently supports options here:

https://github.com/openbmc/meta-phosphor/blob/master/recipes-phosphor/ipmi/=
phosphor-ipmi-flash_git.bb#L21

>
>
>
> One more question, how to decide address and length for lpc?
>
>
>
> Thanks in advanced for any insight!
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
>
> This email contains confidential or legally privileged information and is=
 for the sole use of its intended recipient.
>
> Any unauthorized review, use, copying or distribution of this email or th=
e content of this email is strictly prohibited.
>
> If you are not the intended recipient, you may reply to the sender and sh=
ould delete this e-mail immediately.
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
