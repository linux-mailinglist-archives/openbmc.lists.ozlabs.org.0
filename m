Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A004A2BC5BA
	for <lists+openbmc@lfdr.de>; Sun, 22 Nov 2020 13:59:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cf9NP4R3gzDqWF
	for <lists+openbmc@lfdr.de>; Sun, 22 Nov 2020 23:59:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jByAQJ+u; dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cf9Lm1SpJzDqVZ
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2020 23:58:06 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id u21so15218431iol.12
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2020 04:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S1hgdTmB17tzRQQ13aTtYkkCcT8aX3YQpTwyy5drHYU=;
 b=jByAQJ+uK/v0uEXpLeiAyobLsbW/Gn89/CxW4mn5OgCyJ/fxbZngbMpjH8kKaZMExa
 rmssVg8cV5y3dMUFhvCk7LOXF//IzHCzFqA7jN8ms4LOx39Z/5muOZqua9lIiED0NkrC
 gppLKxq9xt2WzTQ95EHTQpywqBbaLQFXa7Rx81VrDZdCUYtg4ssVardBS8UZ1eDNT28e
 W9d4HWvyuDUYtcEZn54JxmC6j7TV5sW9lBXCBtP6neW9EomJ1eN8kDuXbxqdkxlAZHxq
 pQjV/bAiSXlkAQCFVUBhAYYchQ0Rt8/2wg00W7lwXeu+5o3xXmLPvmZ1lwmsIY4Q7f4T
 v6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S1hgdTmB17tzRQQ13aTtYkkCcT8aX3YQpTwyy5drHYU=;
 b=GzV6RKkExqHKdlcj+azeB0KIM2HP//SlCRLE5nyZb8N0oSZZE0w+kfQoOlw9v8APpn
 R/bNqngvR6QzKfTA6uL6bEGdrN+RvFB4gRagun4/4MpY3kL4q4O3YhU3AN2aNwwizlm0
 lsUMu3XXy2ypeDCR2BDSwtq0+YwXKnpVZXB+DO/33xouu02XQQpBfLiCkkwWL40gyoDo
 0Htc2BUwPZezzFxRl/5zgTIL1tTevJLoJ4f9hUpHdJ46Ow6xtEzxamrkV/MqKccEHTdS
 6aTx7oCNQTR6s5I64EDrPIiXASHsNnjiG3sDLVGLwxx1ibUs1DSIPQSaH/mogkyJN3Df
 k4ag==
X-Gm-Message-State: AOAM532jjf4Mq0rrb/RuwYo9JlwcccCij9Ob/HrPJSSxUK+IyVWXqSY+
 b4DDfsDiMggF8+DkPV5hp3Qj9u6UL0ytKbt+9HE=
X-Google-Smtp-Source: ABdhPJyoFpY5nnruG30LA+QtK2FARrQKILNERsqnF0ixXw5yxvm1H5QIqwp+Pf3zPofAFoDx0Iq9uKQXnzVUcx5Vzig=
X-Received: by 2002:a05:6602:54:: with SMTP id
 z20mr12272353ioz.92.1606049880061; 
 Sun, 22 Nov 2020 04:58:00 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR04MB309381BFAE06A3462E57E0C6E1FF0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB30934A3A567C8025C3F72F4FE1FE0@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30934A3A567C8025C3F72F4FE1FE0@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Sun, 22 Nov 2020 15:57:48 +0300
Message-ID: <CAHsrh9JsuPkWZvh13MYSVwCKFtctiMRxv1Sk0X0rx5Duc=AvMg@mail.gmail.com>
Subject: Re: Boot Order in Redfish and DBUS
To: Jayashree D <jayashree-d@hcl.com>
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

Hi Jayashree,

AFAIK,OpenPOWER systems use dbus interface
xyz.openbmc_project.Control.Boot.Source:
https://github.com/openbmc/phosphor-host-ipmid/blob/515bc375cb8daaee981bae9=
7fa7ae80e7bf65c62/chassishandler.cpp#L1720

--
Best regards,
Artem Senichev

On Sat, Nov 21, 2020 at 9:36 PM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Internal
>
> Hi Team,
>
>
>
> I am working on BIOS boot order in my environment, to get and set the boo=
t order sequence.
>
> How the boot order settings is handled using dbus interfaces and also in =
redfish ?
>
> Please provide your inputs/suggestions on this.
>
>
>
> Thanks,
>
> Jayashree
>
>
>
>
>
> From: Jayashree D
> Sent: Friday, November 20, 2020 2:09 PM
> To: openbmc@lists.ozlabs.org
> Subject: Boot Order in Redfish and DBUS
>
>
>
> Classification: Internal
>
> Hi Team,
>
>
>
> I am working on BIOS boot order in my environment, to get and set the boo=
t order sequence.
>
> How the boot order settings is handled using dbus interfaces and also in =
redfish ?
>
> Please provide your inputs/suggestions on this.
>
>
>
> Thanks,
>
> Jayashree
>
>
>
>
>
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and in=
tended for the named recipient(s) only. E-mail transmission is not guarante=
ed to be secure or error-free as information could be intercepted, corrupte=
d, lost, destroyed, arrive late or incomplete, or may contain viruses in tr=
ansmission. The e mail and its contents (with or without referred errors) s=
hall therefore not attach any liability on the originator or HCL or its aff=
iliates. Views or opinions, if any, presented in this email are solely thos=
e of the author and may not necessarily reflect the views or opinions of HC=
L or its affiliates. Any form of reproduction, dissemination, copying, disc=
losure, modification, distribution and / or publication of this message wit=
hout the prior written consent of authorized representative of HCL is stric=
tly prohibited. If you have received this email in error please delete it a=
nd notify the sender immediately. Before opening any email and/or attachmen=
ts, please check them for viruses and other defects.
> ________________________________
