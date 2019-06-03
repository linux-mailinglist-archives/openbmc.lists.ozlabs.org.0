Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09633122
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 15:33:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hbbs6HXDzDqLc
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 23:33:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aY3z4lun"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HbZW5rZDzDqQW
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 23:32:18 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id n14so16060462otk.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WVml+uBEKC5QHwhyBmhYYos3C1HA9S2NpSyGQQi7lFY=;
 b=aY3z4lundWUMXidvJMkNicTdT9CUE++QT6K3MWpBmuTiLaY9OuwIf0zhFaKvyqltb0
 wEzjrCqDDMrsGcsuza2ceEwZXeXJoWE8ctvGENqHigy0t0C10yPcmPWonKiV3bffeSwf
 AKVge3LrWImqTKF/YTbdUSj9cm9DP0q/L9DKpOLfJmpOAGFTZ9yrKDrRdpdxqRbfy2Oa
 4j9O7OojZamsYCkQfdLyB+LA+aXhMEJvCa7Jl3mScTJsebzXIkMnPMvVTAzOscZnRx7J
 NX1SHqNBahvt4h+63QNAEpCUOPT10ybWxYojHeAlPDpFHek1nc60ePPOK3FgCc59GnlZ
 7xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WVml+uBEKC5QHwhyBmhYYos3C1HA9S2NpSyGQQi7lFY=;
 b=e5nsGvc21cWsdq+QrIMjLOkv4ISZd0f8g+IN4vLokexHFm8ocmWr8E6XyUYe2KTtET
 6IFSx7lzyLpT2+H7kmxG35bkhpQfBYF1DIGmHySo+27OaR4yM0jERKJdMS3/mf1BATqT
 70H2YNuqzjjCb878+jBd0Re6cFlVlMqpNqF66EltjM5Ax5W03VGNPFgbauHsZGbFdbB/
 fZmdU47K4QfupxYZwDekEATrsykLNvrQBxrq9TsT8e9RLQGFqkHcyEvzFGc1qTWCdGi4
 3AblEM6wATqQ2SQPjU+TAbXBoOVcdb5mX4I5BMoJiIghJ2pHACNAyfuFhNDGKy3xw5Gu
 oWRA==
X-Gm-Message-State: APjAAAXKIMTqNLPBhIXi/sZbbJX168d/XeCdfTiJkTp08QaHcvyGHeXA
 rWgcf58WmsQpCBAymdvXCiBJhZy9EhMP6wcyuxU=
X-Google-Smtp-Source: APXvYqx22e9kJzKfIKqIsZQ1OXj3P0qxlLeaIyO3Fr18nThFsEvG8rLUYtOvt6OCVdKhTQMJEevWi+zuAz0uxklCmAs=
X-Received: by 2002:a05:6830:110e:: with SMTP id
 w14mr1220706otq.296.1559568735260; 
 Mon, 03 Jun 2019 06:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
In-Reply-To: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 3 Jun 2019 08:31:59 -0500
Message-ID: <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
Subject: Re: [Design] PSU firmware update
To: Lei YU <mine260309@gmail.com>
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

On Mon, Jun 3, 2019 at 3:54 AM Lei YU <mine260309@gmail.com> wrote:
>
> Hi All,
>
> This is a proposed design of PSU firmware update.
> It will be posted to gerrit for review after we have resolved comments
> in the mailing list.
>
> # PSU firmware update
>
> Author:
>    Lei YU <mine260309@gmail.com> <LeiYU>
> Primary assignee:
>    None
> Other contributors:
>    Su Xiao <suxiao@inspur.com>
>    Derek Howard <derekh@us.ibm.com>
> Created:
>    2019-06-03
>
>
> ## Problem Description
>
> There is no support in OpenBMC to update the firmware for PSUs.
>
>
> ## Background and References
>
> In OpenBMC, there is an existing interface for [software update][1].
>
> The update process consists of:
> 1. Uploading an image to BMC;
> 2. Processing the image to check the version and purpose of the image;
> 3. Verifying and activating the image.
>
> Currently, BMC and PNOR firmware update are supported:
> * [phosphor-bmc-code-mgmt][2] implements BMC code update, and it supports all
>   the above 3 processes.
> * [openpower-pnor-code-mgmt][3] implements PNOR code update, and it only
>   implements "verifying and activating" the image. It shares the function of
>   the above 1 & 2 processes.
>
> For PSU firmware code update, it is preferred to re-use the same function for
> the above 1 & 2.
>
>
> ## Requirements
>
> To mitigate the risk of power loss, the PSU firmware code update shall meet
> pre-conditions:
> 1. The host is powered off;
> 2. The redundant PSUs are all connected;
> 3. The AC input and DC standby output shall be OK on all the PSUs;
>
> And during updating:
> 4. After the update is done on a PSU, the AC input and DC standby output shall
> be checked.

What happens if this fail? Auto roll back or just an error log?

>
>
> ## Proposed Design
>
> The PSU firmware code update will re-use the current interfaces to upload,
> verify, and activate the image.

Yes, this ensures the existing Redfish firmware update API's implemented
within bmcweb will also work for this without any changes required.

>
> 1. The "Version" interface needs to be extended:
>    * Add a new [VersionPurpose][4] for PSU;
>    * Re-use the existing ExtendedVersion as an additional string for
>      vendor-specific purpose, e.g. to indicate the PSU model.
> 2. Re-use the existing functions implemented by [phosphor-bmc-code-mgmt][2] for
> uploading and processing the image.
>    * The PSU update image shall be a tarball consists of a MANIFEST, images,
>      and signatures
> 3. There will be a new service that implements the [Activation][5] interface to
> update the PSU firmware.
>    * It shall run all the checks described in [Requirements] before performing
>      the code update;
>    * It shall run the checks after each PSU code update is done.
>    * The service will verify the signature of the image;
>    * The service shall check the ExtendedVersion to make sure the image matches
>      the PSU model.
>    * The service will call a configurable and vendor-specific tool to perform
>      the code update.
>    * When each check fails, or the vendor-specific tool returns errors, the PSU
>      code update will be aborted and an error event log shall be created.
>    * When the PSU code update is completed, an informational event log shall be
>      created.
Is this a normal requirement when it comes to PSU's? We don't do this for BMC
or PNOR.

>
>
<snip>
