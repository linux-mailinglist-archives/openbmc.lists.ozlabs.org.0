Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589714F376
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 21:54:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488TxP6hzFzDqjT
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 07:54:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com;
 envelope-from=rajeswaran.thillaigovindan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SmejE8s2; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488TwS18g4zDqgk
 for <openbmc@lists.ozlabs.org>; Sat,  1 Feb 2020 07:53:54 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id m13so3398405pjb.2
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 12:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=IwnUJWlSLeCLjQTAYiPVuLQkCsbLONuhBm1m4moNvkE=;
 b=SmejE8s2ofIzd6i1lgR/Oe+CPz5jlUs1H4EtF/pcMizvdWL41DJPx4YNqOrnMIqJmT
 L6epBUI95leYYHCpgUbZtR1XBb3scr3VwHtBvS2xCnSMtgDL9X50pGdQ+MJDoYyAYHNW
 q05Crqahn3gW0IxLgKyDMe6fziO8olzCHMbKDskI+tH3MDGiOSGhnD231Sa6VsImPzjM
 3QvBsg8gXj9YESKsPjRE9MSYilH1hax2q5K0CsSz5RnSkNsigYQeEhL7BTC/4cHprqyo
 k+UbOBaTruv8Xi6+b7XOWdH1P2RlawJmxXjpwGylSi+7IwaPLz21MqfsaJqZ7fKlGRtE
 KcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=IwnUJWlSLeCLjQTAYiPVuLQkCsbLONuhBm1m4moNvkE=;
 b=ln86iJLVRw2lKxkrkZ3WtiQxRFx+trg4KNKT23ztXH8B7sEZrns4TQMv3EAF+EtWYg
 CctxvG8c673HbDPpHxU+G8QRjv9FiGAKk2XAGTa+d5J5ycqKx0DkRRYNgbY3r7ILTXTz
 S1y/4abujfffFXivfl5H7y4gcyq1a0FNu/3JnyXNGdjnBXKg7rT8I4+95yEv09jjcYay
 ajrVl0nlhUZXFdz6+CWtNJqNC3RDvAMoGJ7sFWoOSVifyUq8WLZRXdBgGEPuScypdzNE
 5OPKkmQHjUNSu4TmjLoYOqh4mPhHS4UZdSKxiAQXcvdw/zAn2yIrClkbTvuIOPQgmEdT
 WeFA==
X-Gm-Message-State: APjAAAVdgLbGPd/iVFx7BvWoLI91d/qtMY5VnLn30fXiPAlZvsgC4ku/
 FNh77AIbdR9jyIEADvwUZZc=
X-Google-Smtp-Source: APXvYqwPWodW7kw40SvY6k3q9LurnHfmJO8vl3AAeaZCLEGwWqzvoJ6BZ1hB4MVR8Enl15s9OnNw/A==
X-Received: by 2002:a17:90b:4382:: with SMTP id
 in2mr14673505pjb.29.1580504030807; 
 Fri, 31 Jan 2020 12:53:50 -0800 (PST)
Received: from [192.168.1.4] ([122.167.65.165])
 by smtp.gmail.com with ESMTPSA id e38sm10741463pgm.82.2020.01.31.12.53.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Jan 2020 12:53:50 -0800 (PST)
To: openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com
From: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>
Subject: Redfish EventService Implementation
Message-ID: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
Date: Sat, 1 Feb 2020 02:23:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi,

I am going through the bmcweb code for implementing Redfish EventService 
based on the design document 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This design 
is hooked to the journal based Redfish Event Logging. For life cycle 
events(ResourceAdded, ResourceRemoved, ResourceUpdated),  using D-Bus 
match, bmcweb can create an event log. This requires a JSON dictionary, 
comprising an array of Redfish Resource Name and the D-Bus path. This 
approach works only in case of one to one mapping of Redfish Resource 
Name and the D-Bus path. For propertiesChanged events, if the Redfish 
Resource property is not on the same D-Bus path or the Redfish Resource 
property name is different from the D-Bus property name, then an 
additional JSON dictionary to maintain this information is required. 
With D-Bus match alone in the bmcweb, Redfish EventService can't be 
fully supported. For the Message Registers and the Resource Types that 
are supported, the relevant OpenBMC application must create an event log 
in the journal using either the phosphor::logging::entry or 
sd_journal_send() command.

After realizing that with D-Bus match in the bmcweb alone can't help to 
fully implement EventService, I prefer to avoid using D-Bus match in 
bmcweb. Instead, I prefer to modify the OpenBMC application that 
generated the event to create an event log in the journal. Do you see 
any advantage of using combination of D-Bus match in the bmcweb wherever 
it is possible and changes to OpenBMC application in other cases to 
create an event log ?

Your views are highly appreciated.

Thanks,
Rajes
