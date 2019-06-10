Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC63AD7C
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 05:16:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Mdb13vm0zDqPK
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 13:16:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qdFME67Y"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MdZS0RRqzDqG0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 13:16:15 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id e3so5732502ioc.12
 for <openbmc@lists.ozlabs.org>; Sun, 09 Jun 2019 20:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OWUEqY2uLtw835NIC8BvOPg1Pd3QrF9jy+vV79/M8go=;
 b=qdFME67Yj0g/Lc1tZQH/CZ8dxUysM2E2mIc4bwRM8gICAVVfP/hYGiVsBYTVMURPxh
 xVvMlkbAQA6+5UDEcJgKo+/FcpIiSPolRn6gCT5Uf0pW+llXkRWeHd+zE4wgE9//q3TO
 E3qDoTfIhwabRh8Xwwexd8XKpUbygF4LlCpAgZt42HWLD+NfQubcNtBmtyRzxRVMoAEN
 V9Dt2kwKvrkBOw9Wurgcgk4bR4NDrdeo/FXqu4dYIP2M08W13VBuFuSZOuv1dc2ywVKO
 7Szxi/76EmkAcWOlXNlqxNBYXnuJiK62qP0CO+Of2qvwDLdIbkXkQR+LGWtP/J6GghFp
 efbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OWUEqY2uLtw835NIC8BvOPg1Pd3QrF9jy+vV79/M8go=;
 b=CY+3pfAVoq96zNTz3YQlkk2y20KFGLQG2oAOjJAXkQgV3/NFq2XruXu9AStiAtHmTE
 r+/dGD8ND0NRCfEwxf5fM1r+svnpQRAr/jn4UDSqSjrZfXppDRdlYuP5/oOzJJPfcoau
 ViWwonykGiT/9ByBP7tLo1+Y6Hx2MU2qcapeZA0Gvf0CFzrDiDAMwurqVEc5+BdI9K8a
 ROBckZn03j/anCYNjDAjeUAuTBof4kb8PjEdeEajDPnJqAiD3g/zBPO9GSJ7MZVoYDIR
 lBINxbunkwUylEKx6aIGr3Rib7LVOA4tPeLMUhL+15bmijhCq1cmErIzeghF2TBzDDLk
 CKyg==
X-Gm-Message-State: APjAAAXFmvA76xNYsXKPpj+WuLRtrKyoQRIdDXvVMZrdPtSx3mN5yqdu
 JU2OyLVBBkyBBFBo++bxcC6jFjgdy+e4sAbRK+w=
X-Google-Smtp-Source: APXvYqx7Wu0DMs2pYR2HJ+0oidQRcBAfv8vFTjrStWxxsu0EFqden5tK2oPH0FHeOqROx2/i94QZmTrt/m/YimHe+BM=
X-Received: by 2002:a6b:4101:: with SMTP id n1mr6346122ioa.138.1560136571899; 
 Sun, 09 Jun 2019 20:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <20190604182635.GD46814@mauery.jf.intel.com>
 <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
 <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
 <CAARXrt=6DwO7cAxyEJ=FEUPF4+gU9npJtWmd31LuqmTpxHu98w@mail.gmail.com>
 <b20a0ffd292efcafc8e4ebad40d810bc@linux.vnet.ibm.com>
 <fdc1cbfa-d337-7219-b748-b251e6f80272@linux.ibm.com>
 <6614b24b-7552-65e7-bebb-1bc07ac62643@linux.vnet.ibm.com>
In-Reply-To: <6614b24b-7552-65e7-bebb-1bc07ac62643@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 10 Jun 2019 11:16:01 +0800
Message-ID: <CAARXrt=c-w0pZeR7-zxekxqn5sHCbKYRaLR6R7x1R_uKhi_TuQ@mail.gmail.com>
Subject: Re: [Design] PSU firmware update
To: Derek Howard <derekh@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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

> > 3 more quick notes:
> >
> > 1) PSs can be hot pluggable, so when a new one is detected, the code
> > update should run then too if the new PS needs one, assuming all other
> > conditions are met.
> >
> > 2) A single system may support multiple models of PS (will definitely
> > happen for us), so this design should be able to store multiple PS
> > images and send the correct image to the correct model.
> >
> > 3) You mentioned the combined image stuff before.  We should just check
> > the timeline for that support aligns with this one.
> >
> >
> Good point Matt on the PS install.  It would probably be a good idea to
> get the newly installed PS to the same image as the rest of the PS's in
> the system.

Yup, really good point.
This implies that BMC shall keep a local copy of the PSU image for future
updates.

> We do support PS's that don't provide control supply (standby voltage)
> when reset at the end of the update, while other PS's do.  Therefore for
> the former case, if only 1 PS has AC attached, we cannot update/reset
> that PS, so please let that be selectable by the user (eg vendor
> specific tool).

This is somehow complex, but if we could defer this to vendor specific tool,
that's OK.
However, if a system has multiple models of PS, I am not sure how the vendor
specific tool will be.
Should we defer that to vendor specfic tool, too?

>
> Also, please provide a way to know that the updates have finished.  As
> we don't want to update the PS's when the power is on (this is vendor
> specific as well), we also do not want to power the system on in the
> middle of an update.  For example, if after a BMC update the PS's are
> being updated, we want to hold off the next system power on until the PS
> updates have finished. Thanks.

This is already supported by the existing interface.


> >
> >
> >>
> >>> The reason I ask is because if we could get clear requirements, it
> >>> is possible
> >>> to simplify the design.
> >
> Would it be possible to support both methods?  The general use case
> being done during/after BMC code update, but also support the more
> manual method that could be used perhaps in the lab to test new psu
> images or in the field if there are problems with an existing image? Thanks.

This design doc will be updated to support both cases.
