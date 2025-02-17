Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF47FA38336
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2025 13:42:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxMjT6YG1z3cVn
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2025 23:41:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739796107;
	cv=none; b=NuD7XcKW55Ncffz7HXkju11MioqFGe40lJO+tJ6eBdOwGYMB3DNld6p1DBTBkn/2dCXyfl8MXOnVhdYZmhA034bFpp2r3iO8hOHp+lwpSvE1nJ0oBMV23mrGwE/CYCGqkC10h3+/ic0M9G3yOeL/yp4KMWTB40COWHJruXmJVfMaMMY7d9mXVb2Xxdn1zBOxcIx6bMtMwiAEo9juHuH2B0eqczIvohH+SfvnYCY6VMMVAAiJS2c/S6JHOYn1Xfhekt5a1pa42uWsDGRAPt2Q7A8woG67OU56wo1+ioNAtBejQivKZIROOFWxXN4FkQrAF6gc4edNae72BeKQhKLHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739796107; c=relaxed/relaxed;
	bh=iLBhUsNy9o3GsZzaI8he2S2i8RgQxCMCzXaDo1b/E60=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dXz0COYRboJnSnqVAlQ3fWz5TJo5eOuoAFSdlieeM3B0JeJo/qBStw/es4QAnkDMQpnFodVvnclcBvpBfsnrIABoihG3/OjYLmdydz2X6j1zxTVLUD/T6fDVRlFj0NEtBdUsSpIREjib/NstyIpotKcG0WpcuQ7Zjn/IIQ+XTMzKhj+mGnc0gGm+hJyo7FDZvZTRJgoAWJ/EnsIDWV0inZH0ryz6t0YenDDsBSK7rIvOp9+N3amcoCCICUHqupQjCrO1iteZVsPEdWvgZEgkNP07fMKw2vejp6kpbnYoS89243FDr2J5YKnp6XLDT6S2bwfCctTF284+fj5jIvd1PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dmejL9yr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dmejL9yr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxMjP3V7Tz2yvv
	for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2025 23:41:43 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220c4159f87so56380505ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2025 04:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739796101; x=1740400901; darn=lists.ozlabs.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLBhUsNy9o3GsZzaI8he2S2i8RgQxCMCzXaDo1b/E60=;
        b=dmejL9yr2rKQ9vEdssbCBn5jDecZ3yEn5GEurAagSduMuy1DoQl9hdEMdoDPB6AOWM
         OHpjRG1SCLKH9UYdVScu2hPOEJYFbBS0Ime4fBt2Z2rxnIb6fchss1w9KKN2p8Xfm9C/
         FW2dbGz99uT8Q7q07e16iR5kTGNkbrrWFFro4Nkr19EAd/39MSqFoPDr1NZ1bkznQqNK
         +GABf5t9PD2sAEyTJsMznZiMQuM7iItwaHISeeYfc5OAgHx6f8YV9pII2509iAH3w6V6
         iKHLYxTz4nmci1MTktP+dcLT0WFIOGaV/Lxse2ZoBz9CqOzpjmNiuScaY+s9uqrVF3Qj
         zmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739796101; x=1740400901;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iLBhUsNy9o3GsZzaI8he2S2i8RgQxCMCzXaDo1b/E60=;
        b=uVx62zlQ1jMsLa/IxZetL/y9ZC19TibM/5lXJx7OBSVTfeAS6hFCK9sZ1FJSq4gchY
         +KDh+94o8OdLlDgAzP5hg3m1o+O7+qTp8F9q8lxTY8koWlz2w0/cJh4IsIO51m7q5tPv
         uQ/vGXhZ5Rjg/fWggXYObry52z4sp/LK5otb664v9LdCv0BHvdLbkkK3wmATJQZKzlGl
         NgVSI0L4fKJWpkMZNBbNJUiCcexIB5h+IM+hm+JJrITjwUPU9cwobCCtRtx+y+cgkfog
         Fu+i5ppdeqY44A+31Ag+7de8BndGfMi2wGBiJ+N9h7tXixaQmxR7LsafnQvMBIcHLYeE
         QR3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXk2rw13dIAr4Aj9635XETR0y9SI34E1jMqEUpoBBGwLQ4ERx1n2+GzidsaAwIYW+er5xzA22ZF@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfIlxJ3KxOZDZ1B3GeFQZB5dRnsgyiMqeWjwTmTGUSjpwvGk8N
	xSQf/aVfDbIUKUTNpvplLgQiCOIMczU0JYUgDlG5BP7a+TMx+TzrqO02lcetJsU=
X-Gm-Gg: ASbGncvntwoxCLd/lO7lN9lkbLOwTzc3h0XweFbIOXvIZxu432ci15zD0Ec2zlrWIwo
	455J1Gq8heaLGQdrdzgTSeXCjtzSMq2N+7ezaTkBl+mUaASdKPKEX544OV3HkXR1HXjp+lVlC4q
	yiNuvqvv8xvgV9So+jgPlfh4psL2Vu1t75bFIYFvtQNokD0c8IXQlqimJfK7FULoJBn6qR0G228
	fZbog9o0FCe6v12d65FliIaAw8kaKM1T+wXCloyvB2INwIwN+AAjGEigZlJU22wZR9SRXfwvI2n
	PBSl8GtCMe/rEK8deo6IL7+yDqwxqJwuBw==
X-Google-Smtp-Source: AGHT+IHY0klzsmyEvTdlRpU3mgqZuacOGGcSvrbhzz3oT35Rhf0eCq/ZwJVj9rUJvg5cFnDSOcCkJg==
X-Received: by 2002:a05:6a00:198c:b0:732:2484:e0ce with SMTP id d2e1a72fcca58-732618c1cf1mr13832383b3a.17.1739796100757;
        Mon, 17 Feb 2025 04:41:40 -0800 (PST)
Received: from [9.113.201.245] ([129.41.58.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73269fa358dsm4075814b3a.91.2025.02.17.04.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 04:41:40 -0800 (PST)
Message-ID: <e674332a-6956-4184-b077-39a0cc0e624d@gmail.com>
Date: Mon, 17 Feb 2025 18:11:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: zhichuang@google.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Manojkiran Eda <manojkiran.eda@gmail.com>
Subject: SPDM Daemon status & Collaboration
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zhichuang,

I hope you are doing well.

I noticed that the SPDM daemon design document where you were the 
primary contributor was merged around Feb 2023 [1]; however, I have not 
seen any corresponding repository creation or code contributions since 
then. At IBM, we are keen on leveraging the recently released SPDM over 
TCP specification from DMTF [2] and extending the existing design to 
support attestation over TCP [3].

I wanted to check whether you are still interested in up-streaming the 
implementation. If so, I would be delighted to collaborate and 
contribute the necessary enhancements to accommodate TCP-based use 
cases. If you don’t intend to upstream, I am happy to 
contribute/maintain code & develop a solution that ensures the stack is 
architected to seamlessly scale for both TCP and MCTP transport mechanisms.

I look forward to your thoughts and the opportunity to collaborate.


**References:**
1. 
https://github.com/openbmc/docs/blob/master/designs/redfish-spdm-attestation.md 

2. https://gerrit.openbmc.org/c/openbmc/docs/+/78257
3. 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0287_1.0.0.pdf 



Best regards,
Manoj

