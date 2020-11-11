Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CB02AF47E
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 16:13:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWSsd0Y03zDqwT
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 02:13:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KlihB3zu; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWSgr23W8zDqfZ
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 02:04:39 +1100 (AEDT)
Received: by mail-qv1-xf34.google.com with SMTP id x13so1002665qvk.8
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=09+d4E5wDypx2r5JDCcQj0M6Ib3U9YUkGCwp5paDvtw=;
 b=KlihB3zuLGdqRg8TvYBloXffftQm19wOHrQEBCdanbdOt1dwwbS3sBMMIM1sIVzN+a
 r4uv4eLvZIBADgeTIshL8sbzGSTKoU0NuSg9lO608XgQZ5ek6ZdxOOmj4WoAftltAzxt
 K1iMM7PUtCq/zHqM0y/syHEYaZK7Yi0XnCxjksydVcuVN8EUvOokWGI9hsJ0BXui4WV0
 QwVfm9maDVQoNi70PYFwN1WYYgauRcs3m/2cJJvNkLUayaSmMdKjYUiPJz7/sJtzTnvM
 q/S1HP6kSYIaGgmvX+veFGRc1QKAaMChr9WHmJBHZ++Ph/Kd+XoolT1+NxqiGOkIQ+3g
 /gyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=09+d4E5wDypx2r5JDCcQj0M6Ib3U9YUkGCwp5paDvtw=;
 b=g3C0NumvxCdw3S/zGP+F3sh+JF3NvHi0U+hDGd9C841W0hsjrDsl7Aj/Dz+v7hRYXw
 JEZYJ09LmiRN9+JD9FpSAWOFJidOlyZ7avCtEDmDBF3JEmk8orhPEZwi8B3JtY/O3nBW
 KGSlMVTs5KA7vT6bf2mErRhJZMZcdfIyPYAT8UMObbNWukIc5s3/YfVUUBesKuwFKPNC
 hJE7fTgx/PpVICjYRFCr+bJ4igp4FDBoxc4MxEzFCuixiFKDttvK4vEj9JsUyyUgvN8J
 TTAovn2CJRaaym6H3S4oc3KBbVeFHfujf+OVTCMVtwLNE3bFT9jhd5OlhgX3/YDfp497
 bFnQ==
X-Gm-Message-State: AOAM530rZNht/M91iRy2miyR4FpOsXTqWWUXZD14HJQAKxAv2Jb80jPf
 htGfLLYoiFZ4u7XBrxYgZroiI4XovSSMskQuF7wKCA==
X-Google-Smtp-Source: ABdhPJwSQYFKmezpBXo8zykcG9/K2nv9bsioIF0KprgmfuPkx4cyZx9ReEgxPPuldpoMqAHLy30yn3UnJ3RmV7I+7yg=
X-Received: by 2002:a0c:fc52:: with SMTP id w18mr12283622qvp.48.1605107075054; 
 Wed, 11 Nov 2020 07:04:35 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR04MB29646B09A78169E38B903C6CFDEE0@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB29646B09A78169E38B903C6CFDEE0@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 11 Nov 2020 07:04:23 -0800
Message-ID: <CAO=notzLDPRuwh-hmUgOq_v3mg6sq8Pcip-+0pu99hOQpbFtbA@mail.gmail.com>
Subject: Re: Queries in phosphor-pid-control(swampd)
To: Kumar Thangavel <thangavel.k@hcl.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrickw3@fb.com>, Josh Lehan <krellan@google.com>,
 "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 5, 2020 at 4:22 AM Kumar Thangavel <thangavel.k@hcl.com> wrote:
>
> Classification: Internal
>
> Hi All,
>
>
>
>       Does the current phosphor-pid-control handled the fan failures or i=
f fan values is 0 ?  Looks like, it ignores the fan values is 0 case.
>
>       Could you please clarify me, how the fan(single/both) failures hand=
led. if both fan failures, Do we need to power off the chassis or need to d=
o power sled cycle ?

The answers to the failure behaviors you wish are outside the scope of
controlling the fans themselves.  As I understand it, it's up to you
or your use case what happens when fails start failing. The pid
control daemon has default fail-safe values you can set, as well as
minimum RPM set-points, so that if some things fail, it'll still move
forward operating in a best effort to cool the system.  But with fans
failing, if there's something more one wishes to do with it, my
recommendation would be to reach out with a broader email subject line
-- there may be something already in openbmc (probably is) that'll
track failures and trigger behaviors.

However, currently pid control doesn't "manage the system."  Which it
sounds like you want.  Or not?  Your question sounds like you're not
sure what the system _should_ do in a fan failure case, to which I
cannot reply.

Thanks!

>
>
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
