Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA27587268
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 08:50:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464bTk54pqzDqyf
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 16:50:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=raviteja28031990@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j9w8ml/n"; 
 dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464bT34fRjzDqQL
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 16:49:39 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id b7so44633834pls.6
 for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2019 23:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=J6u36O8mQnm5B0LEc4k0igv7GZC4jRPsD8SIuUf1rH4=;
 b=j9w8ml/nlyloDvZ18y97W3zBSBlmr/GEYSGQOFpG75/HqQfOmzmWFCRldItqfG0sPV
 HcG8Qtk49c/pSUwnv2ubRYEMDvad6kEF3cw3rgenqU6aoAlsJCXmQ9Y5Yc2mTTY7rAmG
 PWfAJygj8pvpjUNO7GkQf3xPvOUygUDKIg4bt1WZ29h9ZkHkd6EIFx+gU2ZvETXTtT/n
 tSlyW/nFwcxmxyiHJPkaSHylaALL8PELjo9DGsAZjhgnQZEKagZjej6T9gcM1k3oJQfG
 53p3ajky4wh9KYqoLsbOT3E14JZL6sxyzbIrN0t5BB3luVHk1evlrqcJfLFSdsNuiuUQ
 0RSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=J6u36O8mQnm5B0LEc4k0igv7GZC4jRPsD8SIuUf1rH4=;
 b=TjYPkZX/hwJo2cRl5IOMmQV80/OWsmQa+YBk+vsfM4f+2Q1rkdCikebyAtQeVAfkZ6
 qCW328d9lu+bSmt+ChVHjwry+9oS10fs+duMCjr+7bxpj03Z5A6mVSwERmrBByZdcSLO
 056ZAJ48ctuZ+LfDfTGbLQ995NKmi7g5Phis1TMtceZlQtAwBO/bDl5NQWDPdEjCHsYJ
 12E8S4/Ucdoi3pqAzsDKsPwO2ilB1kjVrxuPQoz3x6sUVPM0iy7QHroaIN34iH6wR2xj
 +j9krQI4YltID2M/wrVOsBKULPJbi0FCyOi91TEl32c//PNxaz3U4Uj6yB1sk03AI9CN
 MmYw==
X-Gm-Message-State: APjAAAUomBfz3L/R0nu4wJWyeAdlrs/5qzoFk+YvqtI7/YhZVL6sPKmQ
 nTTKGlipl3TtY/fi3IrLa69V4TyT
X-Google-Smtp-Source: APXvYqyISzwYAUhk0m/rYdv4Qg3JH/n4ly+SwEDGtFVaAUXGb5QXptDGbIicac+GC0HspwJlP4C2ww==
X-Received: by 2002:a17:902:2ec5:: with SMTP id
 r63mr17390661plb.21.1565333376008; 
 Thu, 08 Aug 2019 23:49:36 -0700 (PDT)
Received: from [9.193.89.52] ([129.41.84.90])
 by smtp.gmail.com with ESMTPSA id z4sm148158099pfg.166.2019.08.08.23.49.34
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 23:49:35 -0700 (PDT)
From: Raviteja Bailapudi <raviteja28031990@gmail.com>
Subject: Continuing discussion on Handling persistent files (/etc/group)during
 BMC updates
To: openbmc@lists.ozlabs.org
Message-ID: <96f5e075-b324-90da-f004-703ab6275374@gmail.com>
Date: Fri, 9 Aug 2019 12:19:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi all,

We are looking for thoughts and perspectives on the way the persistent 
files are managed across BMC code updates.

The problem is regarding the code update where, as a part of code update 
we don't touch any of the persistent files like /etc/group or /etc/password.

what if the new BMC image has an application which requires some changes 
to be present in these persistent files ?

For Example:
Let's say the BMC image which is used for code update has a new 
feature(ex:avahi) and it requires avahi user and
the group to be present in the /etc/passwd and /etc/group to even kick 
start it's daemon.

How to update such persistent files where customer data might exist?

One of the quick solution i could think of is:
- We can identify what is missing and then write a service override file 
to make the necessary changes in the persistent file.

But i am still looking community thoughts to fix this issue? There was 
already a mail sent regarding same, please find it below:
https://lists.ozlabs.org/pipermail/openbmc/2018-March/011162.html

Thanks!
Raviteja


