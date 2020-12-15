Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A90BE2DB1FF
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 17:59:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwPc54dnszDqN5
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 03:59:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f8WJ7Y1f; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwPbF1N78zDqD3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 03:58:15 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id f132so24037196oib.12
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2020 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=mkFC7aFjIGH5gFGWfwhDJXkRA6RMalzLd8wl6VaGdaU=;
 b=f8WJ7Y1f01yWkfP4Ks6OAJqEwkC69Lh5sstrb7+ABSagABzxZtM5gl5JsAOU1ibCT1
 adLnJStXHJyPjfQ9pe8tfKVX4B/LOxs3NQP3hhE3W8r+WGVLDYdOP1f+t8D/mRXYUEpN
 V1t2KYhcioyAAASWB/MeMFnYpPgrJZTPhLgEr2UDhEra8h4AcYuK6uugCljxkGUIf7Ln
 zXQ0LJCqHFsArdOs5X8IRh4NG0MHh1Loz2FhjRdQawZfq72KsQ0ca89uFxc1WXl3OkHe
 IqPbEmeeZ4KamMlnNlLivq6Gj+n57UwaeFeidgQTLf2P0vqwdWMqKG6L9vz1GmkrumFz
 YDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=mkFC7aFjIGH5gFGWfwhDJXkRA6RMalzLd8wl6VaGdaU=;
 b=SryhcjayMpT63urQaMC8gdvNyjOFtHsEa5pcRi8tLLsFbkR9m/QPJj4COk0PoteeZt
 owxBuZkYGFCp/RaYrEDLJ4M0ox9rB9wnxqpa3EjMIKjUYelO6ywWQv2nd4omKvUjA/Gr
 QRoFPEZlMqdNqUdu8MF1b7zSuBKktmcWx4bRcLv6NkaOSlJRSLWz86n4Ju9q9KNsEDiZ
 xBa/YmDSmUV9lcPyofxM1BXtetj0hkAwoTZD/VzpOwWB7xctChbKnT3XPO9QmB0QJiYl
 KtNswAsFy6JekkVkBwq3pD2NblsbfPrjw16inqSKqSDgwff1NBSuxT+YgN9X65iyhUxN
 sgUA==
X-Gm-Message-State: AOAM533577HaZy/E2hwZa/HDLavw/3Qfd1VQnNhZg7QQWjZJlGj1CsV3
 UVHUb8IGCaWBXMXuiUnxQF5MLXZn/G7NTQ==
X-Google-Smtp-Source: ABdhPJwlf485B/RDDAqt6AZ1PH8pSWuZoH6oNDLnaon3ZKouOqBDeLm90F5zU0Jz0ak5uRp0iixjiw==
X-Received: by 2002:aca:dc42:: with SMTP id t63mr22340287oig.51.1608051491833; 
 Tue, 15 Dec 2020 08:58:11 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id y10sm534947ota.42.2020.12.15.08.58.10
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 08:58:11 -0800 (PST)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: Action: OpenBMC 2.9 release candidate 1
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <8a5f94b9-b11d-e0b3-e459-b7c15b68cbbd@gmail.com>
Date: Tue, 15 Dec 2020 10:53:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hopefully everyone has seen - we've tagged a release candidate, 
2.9.0-rc1. We need to wrap up the release before the end of the year.

ToDo's:

1) Start testing the release candidate as soon as possible - post 
results (email or discord), please openly discuss any problems that you 
find on your system.  https://jenkins.openbmc.org/job/release-tag/9/

2) Clean up documentation, bring old docs current, add documentation for 
new functionality.

3) Input needed for release notes - Either edit the wiki directly or 
email me if that is easier for you. 
https://github.com/openbmc/openbmc/wiki/Current-Release-Content

Master will not be frozen, new functionality can continue to make progress.

Kurt Taylor (krtaylor)
