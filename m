Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB322D4691
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 17:18:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crhzv2Xx7zDqkb
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 03:18:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e35;
 helo=mail-vs1-xe35.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mf6f1j+X; dkim-atps=neutral
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crhyx6StDzDqjn
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 03:17:25 +1100 (AEDT)
Received: by mail-vs1-xe35.google.com with SMTP id u7so1166808vsg.11
 for <openbmc@lists.ozlabs.org>; Wed, 09 Dec 2020 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qNINjtTDdY3FpDwdEp6F6+gt17oT7SKt45JXZl9meUs=;
 b=mf6f1j+XcTdc4yNowQsjkVlIe7IAXMNa69MPCe9xTpI3mukFHrzzXnmWSolZStMs/F
 TuXvQmhqdkRqK1YI373Z4SOnye3CyyMKOs00u9OBJov+GY3qpW1brk61JbPyd+H59N3j
 c8ZKc82GNEuqCqsVlpJxb1zDQMW//7Ttc9wd9+Y81YzRnAo0eQdVjPiNS9fI1WhEwLvv
 2BjZSXuOgabLvuC0OiSsuNY/H62eCsHK237/F3qAF/pR25t1yAXaxhRUncHop3xzErae
 FfhfZ5Z8UV0lauTSvzR9SSy5Ao5c+TflPdBfwOxVNBi0koNg3aMRaQUdrKuLi5OeIbJc
 zJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qNINjtTDdY3FpDwdEp6F6+gt17oT7SKt45JXZl9meUs=;
 b=mMk8PIv2L+Dr/eHNm/4pfOsU0QD5abUo3faUDCqpxhYBCYvLx0R6LFFpC9yP70CWTz
 tiv7EiIt3/VbOhYbK1a/OSLfw5N4XFF64PYh07FrJQHuEPLQk7F/+kKCPNZbAoZ/AaEI
 NaVhwMmiZs0dbgEAKUKYF0XjKRAtCgXyyeGuH2B2s/zrbMCGxBIisQCGQERH5TukbHZH
 e8xNCW2s1AQM2VBTgXrXNVhgbuG2/dKjHHgnEEL/zh86e+S3P1Xf4NNa5CWGGsVPBpGk
 Y84ZxhDfb/L5hzp5szPE4hr4DiC4U1cnVTafD9l/VQr23K5bXVsNWUPEWT243zqL61QN
 w3Jw==
X-Gm-Message-State: AOAM533+wbh0Chwu7hgOKtw0uCgelAiW8p50W9ITpfYw1K/g8C4sLZF2
 QAA7otiob5eG8FZItpz6iZcjWRhse4w360Izi04=
X-Google-Smtp-Source: ABdhPJxPTlZFStVphW0F7QnmSap9stjyBkUjNqqV1qq/S3U2/0hJXcPiyMQ3SEXr8rw6pazoQEe9i4IMC0JUeaPA9JE=
X-Received: by 2002:a67:dd95:: with SMTP id i21mr2655660vsk.33.1607530641154; 
 Wed, 09 Dec 2020 08:17:21 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR04MB2964D0B4027D7B3AE80A3E9EFDCC0@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2964D0B4027D7B3AE80A3E9EFDCC0@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Wed, 9 Dec 2020 21:47:10 +0530
Message-ID: <CAM=TmwX79oj-KZ2mj1ENGcGnq37TCo-KijWENU3_3mWC2AtdAw@mail.gmail.com>
Subject: Re: Add firmware implementation in pldm
To: Kumar Thangavel <thangavel.k@hcl.com>,
 richard.marian.thomaiyar@linux.intel.com, sumanth.bhat@intel.com
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kumar,


On Wed, Dec 9, 2020 at 9:20 PM Kumar Thangavel <thangavel.k@hcl.com> wrote:
>
> Classification: Internal
>
> Hi All,
>
>
>
>          We planning to do NIC firmware update for our system pldm base.

Great!

>
>          So, We would like to add implementation support for pldm base fi=
rmware update. This should be generic for all to use firmware update for an=
y devices.
>          Do we need to create files =E2=80=9Cfirmwareupdate.cpp/.hpp file=
s=E2=80=9D under pldm deamon as generic to handle firmware base pldm comman=
ds?

Since there is a PLDM firmware update specification, a generic design
and implementation is a definite possibility.

>          Also, please suggest to repo add the BMC applications to send an=
d recv the command handling.
>
>          Could Please provide your comments/suggestions on this implement=
ation.

Will you be able to update
https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md with
a design section on firmware update? Some of the things I would like
to review via this doc update:
- How does this integrate with the current OpenBMC firmware update
architecture, and also with Redfish update service?
- What will PLDM run on? RBT or MCTP? MCTP over what binding?
- Do you anticipate changes to libmctp?
- How does this fit into the existing https://github.com/openbmc/pldm
design? What new components will you be adding? Will libpldm and pldmd
be impacted, and how?
- The 5.9 Linux Kernel has some APIs for PLDM based firmware update.
Can we use those?
- How do we plan to test this? Is hardware a must? Or are you planning
on mocking a PLDM responder?

I think a quick review of such a design doc will be beneficial before
delving into code. Also, please note - Richard and Sumanth (copied
them) are working on similar stuff as well. So there could be scope
for collaboration and to avoid likely duplicate effort. We do talk
about ongoing PLDM activities in OpenBMC in this meet -
https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG.

Thanks,
Deepak

>
> Thanks,
>
> Kumar.
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
