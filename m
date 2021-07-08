Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C53DE3C15F1
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 17:27:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLKtK5Y7Mz3bZv
	for <lists+openbmc@lfdr.de>; Fri,  9 Jul 2021 01:27:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dlH3pbAM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dlH3pbAM; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLKt16fHhz308S
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jul 2021 01:27:37 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id c28so16395886lfp.11
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jul 2021 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K+cPpaNe4h/uSCjojSPYdpLjfGLTv6p9g/FCrsFVaI0=;
 b=dlH3pbAMtp/DZwxzHlTNj62DJ8pZkYRtcyk7yjYWLjM8us4vcZewP0VG6Pyr4UKHe9
 NVjuPJ2j9tqomHCxc7I3reGmCtUGXIJZHZVIB2fYbUr+s3zej26QB7gjchlW7U5oiZyv
 t/mhxk7d9kjLRoGfIcW6QSy2xWxOz57BFqX8agLe6R9PBzBhz7U9ydORkj/ZOlafBomv
 j9w1yx864cDSuNMuFoiSAsEK3VLx3fuzLQfaSSFlVgpwbTJaCeQy3mXtByVA0GmhhTtc
 Rkck/8kauOn4GJbwIcoM0K4sxydxeXTN4Phh3uUZ2gXrPrpXEi+lLgCuBBRiXxvpFW6j
 lNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K+cPpaNe4h/uSCjojSPYdpLjfGLTv6p9g/FCrsFVaI0=;
 b=bJMmDl11yIvUjk4oNonWuMV7TejS2Scg0pmvEZrAbJu3pCkHLxn/YeEEELPdDCAyaF
 lpgzMhMVo1S5TXAc1QBq5/4GeZdi/2pcoHM1u5awlH1CfnRx2rny3iEpKa8zSjRCPk6c
 Xy+wBYsmeCDYQuyc/32dLFwpdUXgQjxF+q2QHCR9frhV7d3jPV+F9ipNg3j9BYs1j6Ey
 dOojhjFF/Oojv6yHReG86WJcMgKts0P1Y3X2mATXZAx467tXDR/CPKAglSdmhq5f8t0W
 l8ASddpGfPicI9cVl3eEMbv0lfbzZ4sk4SEwnwx9gMERhy4grcS+tBNfU6nGmoEKmWII
 8Wdg==
X-Gm-Message-State: AOAM531uMSL0mdZL5uspQcfNzfySLP0wlWr4nDPpTjMHmUN8Ao77ZyMp
 mUy5HYx+HrpCVs2dFFShNl0=
X-Google-Smtp-Source: ABdhPJy3AMHerO/IoJyBPF0OJMTSyhIVKJpx9r7CsqncLwNbv1WSm0M3BQQGdJ7If4qY1IBEJXbIQg==
X-Received: by 2002:a2e:5c81:: with SMTP id
 q123mr24579033ljb.461.1625758042590; 
 Thu, 08 Jul 2021 08:27:22 -0700 (PDT)
Received: from gmail.com (109-252-99-189.nat.spd-mgts.ru. [109.252.99.189])
 by smtp.gmail.com with ESMTPSA id a29sm223186lfk.293.2021.07.08.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:27:21 -0700 (PDT)
Date: Thu, 8 Jul 2021 18:27:19 +0300
From: Artem Senichev <artemsen@gmail.com>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
Subject: Re: Using smbios-mdr:  expected file format
Message-ID: <20210708152719.2b5apj5pslvpbfhz@gmail.com>
References: <DF4PR8401MB063422AB09B179DBD08A32F48F199@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF4PR8401MB063422AB09B179DBD08A32F48F199@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
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

On Thu, Jul 08, 2021 at 02:31:44PM +0000, Garrett, Mike (HPE Server Firmware) wrote:
> We have a method to transfer SMBIOS tables to the BMC (a legacy HPE-specific method implemented in our UEFI firmware), and on the BMC side, we can create a file at /var/lib/smbios/smbios2.  We have also integrated smbios-mdr into the build.  I'd like to match up our file format with what is expected by the smbios-mdr code to unlock all the goodness onto dbus.
> 
> Is there any documentation on the expected format of the file?  I gather there's a header (struct MDRSMBIOSHeader) But what structure is imposed over the rest of the data.  I'm hoping its something as simple as a concatenated set of SMBIOS records as defined in the spec (header(type, length, handle), type-specific-data, double-nulls).

Hi Mike,

There is a very simple format: header and SMBIOS dump.

This is how it works on our servers (patch for intel-ipmi-oem):
```
#include <smbiosmdrv2handler.hpp>

void handleSmbiosDump(const std::vector<uint8_t>& data)
{
    // save dump in MDR format
    const std::filesystem::path mdrPath(mdrType2File);
    std::filesystem::create_directories(mdrPath.parent_path());

    time_t timestamp;
    time(&timestamp);

    std::ofstream mdrFile(mdrType2File, std::ios::trunc | std::ios::binary);
    const MDRSMBIOSHeader header = {mdr2Version, mdrTypeII,
                                    static_cast<uint32_t>(timestamp),
                                    static_cast<uint32_t>(data.size())};
    mdrFile.write(reinterpret_cast<const char*>(&header), sizeof(header));
    mdrFile.write(reinterpret_cast<const char*>(data.data()), data.size());
    mdrFile.close();
}
```

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
