Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55732B35
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 10:54:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HTQD2108zDqS0
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 18:54:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12b; helo=mail-it1-x12b.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XUy+K4hw"; 
 dkim-atps=neutral
Received: from mail-it1-x12b.google.com (mail-it1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HTPj2QVLzDqQF
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 18:54:16 +1000 (AEST)
Received: by mail-it1-x12b.google.com with SMTP id n189so6949181itd.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 01:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eQU1RZuJY/OTLmGk8t+STLsjHzSCa2oIJfb4QyjsA84=;
 b=XUy+K4hwszJkr1KzUsAtLaFpnBNd9GCkaV6kXDddc/ioO4DC967UaPAMD3IBFg+doR
 wPo6CHmmpsC6O3tuikEUBaAIETDTw8aR7caZDaBl1yiF4Jye1oNfNFzNlaHbSRxme/Fy
 gXKokkoUdDTDtHEbUzrM4HkYW1JfzpmLjXOykKmncQ1do2rZPI74YvVfH9f53HKLXnMd
 5WaPENcTbrgw6q8D9oTV1TRUiQbFihW/CxCeub+PJHKvFs+nE5OpEjgsEYxqn6CnfdDf
 5Z49txJX/ljrC7TvDohQI1qbAggKOQTx1TO2KYFayDeO8DVDUuik7imnN0dLAYfJpz8X
 KBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eQU1RZuJY/OTLmGk8t+STLsjHzSCa2oIJfb4QyjsA84=;
 b=Q3PYgi4veWSrPJ+rPAInmVsNSFB9QG4jHjMv/hejSJWigqbFe1XrDP9PcRWulLW2MT
 vRkUoMoyGcJNd/wtWl1IVFu9lfejFLRN7omSdxPkqLinjTLK0xzciqkwer9u/Y/WOom9
 zdWXPWKhQz+L7zQZ2dmVnvodGwf3CA1BEai/zGc79yq2vkUdrrAxUa4FqN11jcXGsFgJ
 RGrN4pjm7hYfZMbD/Pbv9k3+duAfU8qPU0o6C3QgcusCiLyp1KCWHbJON3Bd19LAqzwF
 OiKWBQlJy6D/3bQu9U3K4GwYIkEnwT8QXCagflMIx648/FS8o1d19uqTMg8MLDPYWDS2
 o8FQ==
X-Gm-Message-State: APjAAAXwsjulgtSsKz/AqnQ82f3NuEZwbAGwKMXCHLoVO2WSQ6EKe8u/
 6mDOe03p9EoBe6a6iniADvwgNzjlfWA53Y8u5rngiMsCnUtCOQ==
X-Google-Smtp-Source: APXvYqwPZKEE/liYwZLdeu+gVUhpNefeHezQKGm+CeLffIMQbxD1tqzDrvHnBpKPEN7GSXTlELrsJAI/EGlw9g0Tdac=
X-Received: by 2002:a24:7b11:: with SMTP id q17mr1691132itc.49.1559552053344; 
 Mon, 03 Jun 2019 01:54:13 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Mon, 3 Jun 2019 16:54:00 +0800
Message-ID: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
Subject: [Design] PSU firmware update
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

Hi All,

This is a proposed design of PSU firmware update.
It will be posted to gerrit for review after we have resolved comments
in the mailing list.

# PSU firmware update

Author:
   Lei YU <mine260309@gmail.com> <LeiYU>
Primary assignee:
   None
Other contributors:
   Su Xiao <suxiao@inspur.com>
   Derek Howard <derekh@us.ibm.com>
Created:
   2019-06-03


## Problem Description

There is no support in OpenBMC to update the firmware for PSUs.


## Background and References

In OpenBMC, there is an existing interface for [software update][1].

The update process consists of:
1. Uploading an image to BMC;
2. Processing the image to check the version and purpose of the image;
3. Verifying and activating the image.

Currently, BMC and PNOR firmware update are supported:
* [phosphor-bmc-code-mgmt][2] implements BMC code update, and it supports all
  the above 3 processes.
* [openpower-pnor-code-mgmt][3] implements PNOR code update, and it only
  implements "verifying and activating" the image. It shares the function of
  the above 1 & 2 processes.

For PSU firmware code update, it is preferred to re-use the same function for
the above 1 & 2.


## Requirements

To mitigate the risk of power loss, the PSU firmware code update shall meet
pre-conditions:
1. The host is powered off;
2. The redundant PSUs are all connected;
3. The AC input and DC standby output shall be OK on all the PSUs;

And during updating:
4. After the update is done on a PSU, the AC input and DC standby output shall
be checked.


## Proposed Design

The PSU firmware code update will re-use the current interfaces to upload,
verify, and activate the image.

1. The "Version" interface needs to be extended:
   * Add a new [VersionPurpose][4] for PSU;
   * Re-use the existing ExtendedVersion as an additional string for
     vendor-specific purpose, e.g. to indicate the PSU model.
2. Re-use the existing functions implemented by [phosphor-bmc-code-mgmt][2] for
uploading and processing the image.
   * The PSU update image shall be a tarball consists of a MANIFEST, images,
     and signatures
3. There will be a new service that implements the [Activation][5] interface to
update the PSU firmware.
   * It shall run all the checks described in [Requirements] before performing
     the code update;
   * It shall run the checks after each PSU code update is done.
   * The service will verify the signature of the image;
   * The service shall check the ExtendedVersion to make sure the image matches
     the PSU model.
   * The service will call a configurable and vendor-specific tool to perform
     the code update.
   * When each check fails, or the vendor-specific tool returns errors, the PSU
     code update will be aborted and an error event log shall be created.
   * When the PSU code update is completed, an informational event log shall be
     created.


## Alternatives Considered

### General implementation

The PSU firmware update could be implemented by separated recipes that only
call vendor-specific tools.
It will be a bit simpler but loses the unified interface provided by OpenBMC's
existing [software update interface][1], and thus it will become difficult to
use a standard API to the PSU firmware update.

### VersionPurpose
It is possible to re-use the VersionPurpose.Other to represent the PSU image's
version purpose.
But that requires additional information about the image, otherwise, there is
no way to tell if the image is for PSU, or CPLD, or other peripherals.
A new VersionPurpose.PSU is more specific and makes it easier to implement and
friendly for the user.

### Additional string
The design proposal uses ExtendedVersion as the additional string for
vendor-specific purpose, e.g. to indicate the PSU model, so the implementation
could check and compare if the image matches the PSU model.
It is possible to make it optional or remove this additional string, then the
implementation will not verify if the image matches the PSU. It could be OK if
we trust the user who is uploading the correct image, especially the image
shall be signed.
But it is always risky in case the image does not match the PSU, and cause
unintended damage if the incorrect PSU firmware is updated.


## Impacts

This design only introduces a new VersionPurpose enum into the dbus interfaces.
The newly introduced PSU firmware update service will be a new service that
implements existing [Activation][5] interface.
So the impacts are minimal.


## Testing

It requires the manual tests to verify the PSU code update process.
* Verify the PSU code update will not start in case the pre-conditions are not
  met;
* Verify the PSU code update is done on all PSUs successfully when the
  pre-conditions are met.
* Verify the PSU code update will fail in the case that any PSU's AC input or
  DC standby output is lost during code update.


[1]: https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Software
[2]: https://github.com/openbmc/phosphor-bmc-code-mgmt/
[3]: https://github.com/openbmc/openpower-pnor-code-mgmt/
[4]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/57b878d048f929643276f1bf7fdf750abc4bde8b/xyz/openbmc_project/Software/Version.interface.yaml#L14
[5]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Activation.interface.yaml
