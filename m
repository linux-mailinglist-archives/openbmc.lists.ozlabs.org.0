Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D4FE1C0
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 16:47:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F2mh4ytTzF4C3
	for <lists+openbmc@lfdr.de>; Sat, 16 Nov 2019 02:47:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ie4GRZJF"; 
 dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F2ls1ymnzF3vP;
 Sat, 16 Nov 2019 02:47:05 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id v138so8978759oif.6;
 Fri, 15 Nov 2019 07:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IeQWFeO8Bz9NCxG3NpPBOa4AayBSb0ihnYt89pwTKoM=;
 b=ie4GRZJF2vmFjn0PvA7ySnjxHeX/qh8qVaIcpXfVq5kvluN9RWhRU95bMTlhMbjDYV
 gM6shypa4J00aTeI0EZkdjEVa5J8pd8dAAWRC7RCJREVFv3b5mGCzYCPEQvxB57XrYQE
 gayYr1pUYrQsLcqkkxV7l9sLAGfe2GS6UeLJp9YpYS571VBg8BIRLnTQcOv7kszwJZKx
 HuaZzpUyLxLT8GGlEg7k/d8aS7RCLPP+/4eNa0/MjP7ZBxHjiBZlVhUA78CkZnkHXAs/
 Qfow02rGuUgTPB+7Gjld3XDb1RIKQuJUR6Di4dTDbmCFl1ywubfMp6gnI7xakT/8sI+r
 8UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IeQWFeO8Bz9NCxG3NpPBOa4AayBSb0ihnYt89pwTKoM=;
 b=p9cJAeNhsL4+Vl28loaflhF7rt+4ljfLalDoXzRIEL+ZE9NANom9t9nvXUvpKcTfiR
 yGh9JYtRuz94DZVKNxXzqKhfnFj2yCGO9MMDst4OMEKoPjpd8Z+uMA3k3meS0y4AFd/u
 2TdDkFWbkHVrlVwyX98rBlOaWKvVH1ODdBqIkpNwrRd/cfKJNs6fCfUOHRacqZUPYy12
 Nx3ippqT6EpGCAt5Xff3fL9yCIHJMis/dY7CweRxYOGs7bzCJ0F4P4KDKVw4ahjuYbP4
 JsKrU0su3OS8LVZ6LhiuNEH9f/0RPaRMRuCU57WzUw/YLGWOUQstkZeL8DUSlSJ/JIIc
 5akw==
X-Gm-Message-State: APjAAAWb95H7mrVYbPhdNGUoabLm9SPhLMEg2BgtgYFzx1LsH0QZtJpy
 ZvfHRpKdSZonQN/kzKkyuA6GbAy/3LAaQT3rzX4=
X-Google-Smtp-Source: APXvYqyTw6s57M9TbYi9rh/TKLDiVgjtKwy58dSL5dXAg6mfThDC5/UaeMpOb1y0U4pOQLZyKp3bo76AoHv3u9UPvpQ=
X-Received: by 2002:aca:c64c:: with SMTP id w73mr8551894oif.161.1573832821736; 
 Fri, 15 Nov 2019 07:47:01 -0800 (PST)
MIME-Version: 1.0
References: <d9a820f4778cc2964d6f0a9b8a78d722@linux.vnet.ibm.com>
 <20191112074921.GA4938@bbwork.lan>
 <9ddc3deca00904404c72a49c4f89c8a4@linux.vnet.ibm.com>
 <20191114075131.GA6696@bbwork.lan>
 <8755e79fb8f5b06113a953039daa2348@linux.vnet.ibm.com>
 <7e88ab9cf8e9698afdae885a5477da91@linux.vnet.ibm.com>
In-Reply-To: <7e88ab9cf8e9698afdae885a5477da91@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 15 Nov 2019 09:46:45 -0600
Message-ID: <CALLMt=oEYGDam4km_70bJMOsxDAX9TYheXYYsua8PWcP3EuABQ@mail.gmail.com>
Subject: Re: Packaging and deploying multiple firmware image types in one
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 15, 2019 at 8:50 AM Adriana Kobylak <anoo@linux.ibm.com> wrote:

>
> For the bmcweb change to support the System purpose
> (https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27144), Andrew
> had the comment about if we could have the software manager determine
> the .BMC, .Host, .PSU details out of a System image and populate the
> individual version interfaces, which further confirms that the current
> Version D-Bus interface is insufficient to detail the individual
> components of a "System" firmware image, and that workarounds like
> adding individual Manifest files that Alexander proposed are needed.
>
> Therefore, wanted to see what people thought about expanding the
> software D-Bus interface to add a 2nd version id to the path of a System
> version, which would contain the version information for each
> sub-element, but would not contain an Activation object:
>
> --
> Current, leave as is for individual firmware images:
>
> /xyz/openbmc_project/software/<bmc-version-id>/
>    - Activation: Ready
>    - Purpose: .BMC
>    - Version: 2.8.0
>
> /xyz/openbmc_project/software/<host-version-id>/
>    - Activation: Ready
>    - Purpose: .Host
>    - Version: 1.2.3
>
> --
> New expanded option for bundled images:
>
> /xyz/openbmc_project/software/<system-version-id>/
>    - Activation: Ready
>    - Purpose: .System
>    - Version: CompanyZ-v1.0
>    /xyz/openbmc_project/software/<sysrem-version-id>/<bmc-version-id>/
>      - Purpose: .BMC
>      - Version: 2.8.0
>    /xyz/openbmc_project/software/<sysrem-version-id>/<host-version-id>/
>      - Purpose: .Host
>      - Version: 1.2.3

Makes sense to me. The phosphor-webui code could look for a system object
and if found, only allow the user to update/switch images based on system
level. They could still easily show the BMC, host, PSU levels though.
Or maybe this will just be a config option for the GUI? Either way I
think the GUI would want to show both the system and individual levels
of firmware.

Redfish code in bmcweb can continue to work as-is for bmc, host, psu
firmware inventory. I think we should see if we can get the DMTF to
add a FirmwareVersion property to the ComputerSystem object where
we could store this new system version.
