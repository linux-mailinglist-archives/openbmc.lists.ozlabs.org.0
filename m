Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CC43E87A5
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 03:24:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GksYg04t5z30GY
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 11:24:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sNQbhKZP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=patelabhishek9893@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sNQbhKZP; dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GksM23mcSz2xv2
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 11:15:25 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id e186so1472620iof.12
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 18:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=VZZqBSijd+oEOpukegvg0JerCRsGgJ+Fh1PeLRc4Jm0=;
 b=sNQbhKZPTBR+6JInJG2t7hWQDltRnigPG8xeEPJh+ndYCG1HNOSs2bgZ3+pBc8MkDA
 KTbDu/Samk/9yZ4PUuXfcse/js6+gWOyV7Mop8Q0G0qGxVNipgNEBIL0gQ71w3HRKK6j
 lCCeQ5nAOa+q0bywxCmSYg0THzXKppOmj444bSYOdvKvC+rhm+zebrYxxRlvCDQsVgV4
 UMDSrBc1rT7wfNSFkhqenrQcYmXjLkgi/R+YhvRYXNU0PBoT7mbq6E7m1st339htSO3S
 lsTC2VYVnj4+VvEGzygVOTPoqEsyBe1M6QpQtUvgNu6lMMVyoR/34LjxlweGMLsDCFhn
 YJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=VZZqBSijd+oEOpukegvg0JerCRsGgJ+Fh1PeLRc4Jm0=;
 b=kMSehGQ9naedgtN1VhqdRcQClTMK7gme6gfVvgkyvf38YfMXGVfn0f9jOnhzhgydsY
 uEE4gku7cKKu2Mg1X8vPhcCAVL3xhTfU2OrTOpm+6GEBhflaQfGDvYfk3nRdR9vFYOHl
 eNpzg/SPPH928qXW3Rf3l8230EB01lb5s7DThvPEtYQZLVmLFVG8bVgi6/tEhFtWGdkU
 ecjsHh3LnYytxOZMjZR8QdsRcT0+Ea0J045Wo4wXF0gugFUOPYTX51bStiL7n1censGP
 l6tMcH5EAtr2sMTlYtcAsu5gUEMcRd3PdhwW/Obe1c32rzdBJY8eXbBDMeVP464rohbL
 t7eA==
X-Gm-Message-State: AOAM5328OtR7pX0LwHdHG0NIcvBTy1vWP8Dqc0UZKt9Wy8RNPDUJt7Oj
 1E9nfOq4+hyZgOsMdPrUCdvkXDcDIr9vJQ==
X-Google-Smtp-Source: ABdhPJzUZw+pFpufz8drIArVNkQ0e++OrCWcmseSajVcC4exVdbiMGTAHk6fPKJD9oUp3VddFtsVTw==
X-Received: by 2002:a6b:6e06:: with SMTP id d6mr177017ioh.114.1628644522124;
 Tue, 10 Aug 2021 18:15:22 -0700 (PDT)
Received: from [10.0.0.9] (c-98-206-201-135.hsd1.il.comcast.net.
 [98.206.201.135])
 by smtp.gmail.com with ESMTPSA id j20sm10635047ila.14.2021.08.10.18.15.21
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 18:15:21 -0700 (PDT)
From: Abhishek Patel <patelabhishek9893@gmail.com>
Subject: bmcweb - Redfish - Fix Privilege
To: openbmc@lists.ozlabs.org
Message-ID: <ac7dbcbb-535e-7079-bc30-5ea2130151d4@gmail.com>
Date: Tue, 10 Aug 2021 20:15:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Aug 2021 11:24:18 +1000
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

Redfish defines a PrivilegeRegistry 
(https://redfish.dmtf.org/registries/Redfish_1.1.0_PrivilegeRegistry.json 
<https://redfish.dmtf.org/registries/Redfish_1.1.0_PrivilegeRegistry.json>). 
This Privilege Registry defines which privilege(s) are needed to access 
the URI. There was work here by Ed to have bmcweb automatically use this 
PrivilegeRegistry, 
https://github.com/openbmc/bmcweb/commit/ed3982131dcef2b499da36e674d2d21b2289ef29 
<https://github.com/openbmc/bmcweb/commit/ed3982131dcef2b499da36e674d2d21b2289ef29>. 
The commits below change bmcweb to match the PrivilegeRegistry. They 
include two breaking Operator role changes (3 and 4).
1) Fix Log_services privileges
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45125 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45125>
This change allows Admin, Operator, and Readonly users to access 
Crashdump data and related entries. Before this change, only an admin 
role user could access Crashdump data and related entries (LogService, 
LogEntryCollection, and LogEntry). Operator users only had access to log 
entries(LogEntry).
2) Fix BIOS privileges
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45470 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45470>
This change allows Admin and operator users to Reset bios. Before this 
change, only an admin role user had that privilege.
*Note:* Above 1) and 2) changes are backward compatible because that 
change does not restrict any original user from access.
3) Fix certificate_service privileges
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45470 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45470>
This change allows only Admin users to Generate CSR certificates and 
restrict Operator users.
4) Fix Ethernet privileges
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45469 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45469>
This change allows only Admin users to post, patch, and delete on VLAN 
Network Interface Collection and restrict Operator users. Same for the 
EthernetInterfaces patch method.
*Note:* Above 3) and 4) change are *not* *backward compatible* because 
it restricts Operator user from its ability. Does this break anyone? Is 
anyone opposed to these changes?
