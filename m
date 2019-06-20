Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B0E4C5A2
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 04:53:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tmc01rTTzDqf2
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 12:53:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="emrkRdRv"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TmbS0FmgzDqf3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 12:53:21 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id u19so52389ior.9
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 19:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=KGjN4yvYO488NfHj+51Tb6uQsF7UItJlG1AryRP2vFc=;
 b=emrkRdRv7rXu1icc1bAsllYZEJA0FxwEmBHFhYCjJ0f5ctKWrisoEQtFsS0yajsW9X
 pBlH4Z69R0Bu+KGF7zgNh4UVgexhLqQve6TVIsEkqTw2mm75BvfRhhkPBm9LSzvmQEtV
 u61XBDTrckXyr7YbsbJwIFaAO7jmBcuoPzW+lGGeNWzVw8cplLIAPBrAHMNcr9FrcSBh
 KkAHUs0i86tH/4ig4u7j4kPZ6t9XoqblEZYRafvltj3gl6bQ3D/aaoRBl6we2sXPVb+n
 H66+c88MiNiudlQ401r8qMYN6FxViPWTzoqsrv8Le7zVU03hadnu5FMtFjftEgHB0xs6
 75Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=KGjN4yvYO488NfHj+51Tb6uQsF7UItJlG1AryRP2vFc=;
 b=LCDt1uzWlb3i5sbjFDVgsuEooIUaRL556lkQY4GX34KB4YSXr6Uzo/oWFgAIT9Jlc7
 UYgRZhFjKy6KgYrN/V2ZB9KyLkgzIdbORWPeYCjyC+bCera84g90dnZsEIEyTDcFH4EI
 g4Cv0qM38AWW1m8VaGprfSiqUuXB/rR8Ib/y6oo2Vkb6WIZPSFYVwhV8J7+J6G/v3kqG
 TlToKxIEgou42TImLvYXzxetpNaa4QcPCf5GwRvKO51LoVBocVSwvuD+/LkZdiWh6rqG
 ibE4Il4SWWp0IC58mVhv5pJrgkW90eIeDX2X0TubBnXiQ5oC+VI3YS5GYScDJsTr2JJ3
 f1uQ==
X-Gm-Message-State: APjAAAVko+pFEF9Geh3nrcLi5LJ5xdAITEoabEvHZNaT5wkJL6DjzoIW
 BfYUE1UQZXTElm/7rPDLMqF8g7AwTaWoVyPn/T7vkwDiMgVuyQ==
X-Google-Smtp-Source: APXvYqxEvoHY2wrHW5U5tsSr08paPIq3i8bsGoFhhXhoYE/c40VW7Xhu4rkUjst7+sp4o2nFKn7V0oycsTYnH5v3ckc=
X-Received: by 2002:a6b:901:: with SMTP id t1mr12812985ioi.42.1560999197746;
 Wed, 19 Jun 2019 19:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrtkyUkoFvu_LMFJshPH6W1=ZaW6ABgQPmnnSPdX8um1_9A@mail.gmail.com>
In-Reply-To: <CAARXrtkyUkoFvu_LMFJshPH6W1=ZaW6ABgQPmnnSPdX8um1_9A@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 20 Jun 2019 10:53:07 +0800
Message-ID: <CAARXrtn7UrSrYveV12FCedmkVydbu0ZpgPk5uaf8Sh=e-JEn4g@mail.gmail.com>
Subject: Re: [Design][v2] PSU firmware update
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This doc is submitted to
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22821
Please review the doc in gerrit.
Thanks!


On Mon, Jun 17, 2019 at 3:36 PM Lei YU <mine260309@gmail.com> wrote:
>
> Hi All,
>
> This is the v2-updated design doc of PSU firmware update.
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
> The PSU firmware shall be updated in the below cases:
> 1. The user manually invoke the APIs to do the update;
> 2. After BMC code update and if there is a newer PSU image in BMC's filesystem,
>    BMC shall update the PSU firmware;
> 3. When a PSU is replaced and the version is older than the one in BMC's
>    filesystem, BMC shall update the PSU firmware.
> 4. There are cases that a system could use different models of PSUs, and thus
>    different PSU firmware images need to be supported.
>
> For some PSUs, it is risky to do PSU code update while the host is running to
> avoid power loss. This shall be handled by vendor-specific tools, but not in
> the generic framework.
>
> So the below checks are optional and expected to be handled by vendor-specific
> tool:
> 1. If the host is powered off;
> 2. If the redundant PSUs are all connected;
> 3. If the AC input and DC standby output is OK on all the PSUs;
>
>
> ## Proposed Design
>
> As described in the above requirements, there are different cases PSU firmware
> is updated:
> * When the APIs are invoked;
> * When a new version is updated together with BMC code update;
> * When a PSU is replaced with an old version of the firmware.
>
> ### Update by API
>
> This method is usually used by users who manually update PSU firmware.
>
> It will re-use the current interfaces to upload, verify, and activate the
> image.
>
> 1. The "Version" interface needs to be extended:
>    * Add a new [VersionPurpose][4] for PSU;
>    * Re-use the existing ExtendedVersion as an additional string for
>      vendor-specific purpose, e.g. to indicate the PSU model.
> 2. Re-use the existing functions implemented by [phosphor-bmc-code-mgmt][2] for
>    uploading and processing the image.
>    * The PSU update image shall be a tarball consists of a MANIFEST, images,
>      and signatures
> 3. There will be a new service that implements the [Activation][5] interface to
>    update the PSU firmware.
>    * The service will be started by default when BMC starts;
>    * On start, the service will check the PSU's existing firmware and create
>      the Version and Activation interfaces;
>    * The service will verify the signature of the image;
>    * The service shall check the ExtendedVersion to make sure the image matches
>      the PSU model.
>    * The service will have a configure file to describe the PSU model and its
>      related vendor-specific tools.
>    * The service will find the matched vendor-specific tool to perform the code
>      update.
>    * When the PSU code update is completed, an informational event log shall be
>      created.
>    * When the PSU code update is completed, the image, MANIFEST, and optionally
>      the signature will be saved to a pre-defined directory in read-write
>      filesystem for future use, in case a new PSU with old firmware is plugged.
> 4. The vendor-specific tool shall run all the checks it needs to be run, before
>    and after the PSU update, and return a status to the above service to
>    indicate the result.
> 5. When the vendor-specific tool returns errors, the PSU update will be aborted
>    and an error event log shall be created.
> 6. During the update, the vendor-specific tool shall set the related sensors to
>    non-functional, and when the update is done, it shall set the related
>    sensors back to functional.
>
> ### Update by new BMC image
>
> When BMC is updated and a new version of PSU firmware is included, it shall be
> updated to the PSU.
> This will be done by the same service described above.
>
> 1. On start, the service will check the PSU image, model and version in its
>    filesystem, compare with the ones in PSU hardware and decide if PSU firmware
>    update shall be performed.
> 2. There could be two places containing the PSU images:
>    * The pre-defined directory in read-only filesystem, which is part of BMC
>      image.
>    * The other pre-defined directory in read-write filesystem, which is the
>      location for the saved PSU images by API update.
>    Both places shall be checked and a newer version will be selected to compare
>    with the PSU hardware.
> 3. If PSU update is needed, the service will find the matched vendor-specific
>    tool to perform the code update.
> 4. The following process will be the same as [Update by API].
>
> ### Update on replaced PSU
>
> When a PSU is replaced, and the firmware version is older than the one in BMC
> filesystem, it shall be updated.
> This will be done by the same service described above.
>
> 1. On start, the service will subscribe to the PropertiesChanged signal to
>    the PSU object path to monitor the PSU presence status.
>    (Or maybe subscribe the InterfacesAded/Removed signal?)
> 2. When a PSU's presence status is changed from false to true (or the
>    InterfacesAdded event occurs), the service will check the new PSU's model,
>    firmware version to decide if the firmware needs to be updated.
> 3. If yes, the service will find the matched vendor-specific tool to perform
>    the code update.
> 4. The following process will be the same as [Update by API].
>
> ## Alternatives Considered
>
> ### General implementation
>
> The PSU firmware update could be implemented by separated recipes that only
> call vendor-specific tools.
> It will be a bit simpler but loses the unified interface provided by OpenBMC's
> existing [software update interface][1], and thus it will become difficult to
> use a standard API to the PSU firmware update.
>
> ### VersionPurpose
> It is possible to re-use the VersionPurpose.Other to represent the PSU image's
> version purpose.
> But that requires additional information about the image, otherwise, there is
> no way to tell if the image is for PSU, or CPLD, or other peripherals.
> A new VersionPurpose.PSU is more specific and makes it easier to implement and
> friendly for the user.
>
> ### Additional string
> The design proposal uses ExtendedVersion as the additional string for
> vendor-specific purpose, e.g. to indicate the PSU model, so the implementation
> could check and compare if the image matches the PSU model.
> It is possible to make it optional or remove this additional string, then the
> implementation will not verify if the image matches the PSU. It could be OK if
> we trust the user who is uploading the correct image, especially the image
> shall be signed.
> But it is always risky in case the image does not match the PSU, and cause
> unintended damage if the incorrect PSU firmware is updated.
>
>
> ## Impacts
>
> This design only introduces a new VersionPurpose enum into the dbus interfaces.
> The newly introduced PSU firmware update service will be a new service that
> implements existing [Activation][5] interface.
> So the impacts are minimal to existing systems.
>
>
> ## Testing
>
> It requires the manual tests to verify the PSU code update process.
> * Verify the PSU code update is done on all PSUs successfully;
> * Verify the PSU code update will fail if the vendor-specific tool fails on
>   pre-condition check, of fails on updating PSU.
> * Verify the PSU code update is performed after a new BMC image is updated
>   containing a new version of PSU firmware.
> * Verify the PSU code update is performed after a PSU with old firmware is
>   plugged in.
>
>
> [1]: https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Software
> [2]: https://github.com/openbmc/phosphor-bmc-code-mgmt/
> [3]: https://github.com/openbmc/openpower-pnor-code-mgmt/
> [4]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/57b878d048f929643276f1bf7fdf750abc4bde8b/xyz/openbmc_project/Software/Version.interface.yaml#L14
> [5]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Activation.interface.yaml
