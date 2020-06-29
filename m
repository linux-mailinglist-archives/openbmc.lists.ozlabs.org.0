Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8043620CE8E
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 14:50:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wS573vfZzDqWZ
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 22:50:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O8l9hAa4; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wS3c5jq3zDqMK
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 22:48:58 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id n6so15372078otl.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=i8LTp2/O5HmNMGojBNEV360dsqkn8kKMEaWxS6GWWMU=;
 b=O8l9hAa4vXLvBq1FJM/l7cCAXs10U7zkEyHn20JNpNwDMjBO0Kbx2ULAAyqDx7ahrX
 y58rabocOExMy0/ONvkRRNgvnWs/QWZuqS3l3R65MJhInliU7W+b3xs6IRNVRI/7YSks
 QA4ZHcAmv45zwVf6uD6kqlqeJGs1sq6ehh8TVZRmatxLQDjIhT4eficJdYkNVdeKad6T
 pTGJDhtKqe8FnwH3WX68zavGHMnZAfrRC2s84MVPJ7xXQCpfiwbttxdRCK4JawNaSxlF
 xgjJgZWzBH803WtDo+kfg/9wHuexYfrNrcykWUoDuAe13LQ2dasloZAR1mA6n/ZM1ZDN
 4BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=i8LTp2/O5HmNMGojBNEV360dsqkn8kKMEaWxS6GWWMU=;
 b=nxSUth/6CzXzIHIB7HnO/1L1NlalIYaK9CbWOH4RCpJ6RCt5Eb3n3RCmhzZuSiobDk
 UhY12f1uPP98W+ha29azZ6fvm2BlEphwUMm7hBHpbmA01Nzjb1Iv2YEPxvmRCIQaK0WM
 nMpLazcHTW0b+gsqrrVhWlgcD/Ue5kornpODIx2wywR3ay4gHRUDob7JcAko7WLk+46Y
 55WwSFWjl6m8GSWV/r3NceohFtL9E1IdqnCtJAuh/k2RIZPyL9gyZqD3KFelay4dDxKi
 G1qvAKCw8Z2BxwDdufWEC5Ghbr9nEOyp2rFGyyccAxoigRQ7iUdbUH6lIQZ8Nphk7pQS
 qubQ==
X-Gm-Message-State: AOAM530PDF7Q/+o96kFb0BANtO5skAvky8K4DR+7atPhYQDaA4AieRIB
 o1EUWI/6ul2dwkEfz+98dimK29Mv
X-Google-Smtp-Source: ABdhPJzoiR2AAauTiEDDoTNZJuYHuenfqhcBN6xWe8dY6r4EMJE1DHHOLGU5oyhNSK2J3opHXXvBiA==
X-Received: by 2002:a4a:e9e9:: with SMTP id w9mr13590508ooc.3.1593434935289;
 Mon, 29 Jun 2020 05:48:55 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:a93d:649c:d69e:252])
 by smtp.gmail.com with ESMTPSA id l24sm8208083otf.79.2020.06.29.05.48.54
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 05:48:54 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: OpenBMC CI moved to https://jenkins.openbmc.org
Message-Id: <C8E66216-D6F7-4302-8997-ED2979F3C15D@gmail.com>
Date: Mon, 29 Jun 2020 07:48:54 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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

We'd been struggling a bit with the reliability of our previous jenkins
instance so I decided to just use the opportunity to get us on a new
server and move over to the openbmc.org domain.

Let me know if any jobs are missing.

https://jenkins.openbmc.org
