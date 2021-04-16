Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7443628D1
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 21:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMRQk1cvvz3bv1
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 05:41:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gx+SeYv5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c33;
 helo=mail-oo1-xc33.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gx+SeYv5; dkim-atps=neutral
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMRQW4YvBz3bps
 for <openbmc@lists.ozlabs.org>; Sat, 17 Apr 2021 05:40:50 +1000 (AEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 c12-20020a4ae24c0000b02901bad05f40e4so6368684oot.4
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=7tZeBBeD6q5kL7UWJrbYVv7rNGcJIQdR/POqjr4kw7o=;
 b=gx+SeYv5DsnotWETTq4pZnixZcW29jC362U15qO9GPTqXEWA5DCW0ee4DRFJqTRMxj
 wnFkXDaysArtXeCB/fIzL5I+brcImgXyp9qUVFZmI1ZIBozKFpXzAPVEQY5cjf3GccBz
 jOHQqc/+/lPzCor11NoCJbPeWkqKSSnjLHN/UfaD+KT4wvJTiIGV6f4oZcf4zztTABTG
 QBfWhze7pvP9/c5fNzmNSNRcKMTRd6/SbxT13LxrlztrZpP4Tz1lBatxU4GkQBbeR3Y4
 KzV42fcLplB//9o2YsY4vHhlR8tf0fVhD88jYkvr7+aVSPwPl1tfhKtzZGVI7bebjihf
 RdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=7tZeBBeD6q5kL7UWJrbYVv7rNGcJIQdR/POqjr4kw7o=;
 b=LxTcwwxJGla3vMQxnNSgTplBHQd5EvdylDPySjHR/CUe2N+WHue0fLvUaFNTrN/PzR
 hi9QUSf1IC2j7b4RvlcM4JOSYW9GsidUwAbCvr2YHiSBnNeYfU2MCNvd4KJv9H4j/5t+
 i2C7OZbzyPi0HoHuETK1vB3DKn1t1IqPWbstVeyX392R8oj9h6C6EB9ZurOadOSUTaxR
 pP2ECOFa9AUgpP2+c1KfFz9DpwFq1HA03bcc6sQSGdPdrVbzFWbrK4v13KjXkwZVmxvE
 TaX6O7+VlibuaaofNPrBvdP046/bqqsAfAXYvHlTxJK6cwvXQR9S4ejpDLINzQlq5lfe
 xzNQ==
X-Gm-Message-State: AOAM531yi+S+Vna8y9asH5+6JaI7YisIBIUw+1hXGXa04x4xQZ1/HZyU
 y8rvkhqu+cwtyAhSnoeloEFhnKyOVzk=
X-Google-Smtp-Source: ABdhPJx89cLb1REtzkEkat6iZItzMG7DFgA/TomC473Wdxbsu+le0ZGjBhNKljnRDjYqhZduUPxr5A==
X-Received: by 2002:a4a:48c2:: with SMTP id p185mr4509325ooa.73.1618602046837; 
 Fri, 16 Apr 2021 12:40:46 -0700 (PDT)
Received: from ?IPv6:2600:100e:b022:580a:cc7f:c3b8:410d:2b72?
 ([2600:100e:b022:580a:cc7f:c3b8:410d:2b72])
 by smtp.gmail.com with ESMTPSA id m129sm1610582oif.34.2021.04.16.12.40.41
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 12:40:41 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 16 Apr 2021 13:40:40 -0600
Subject: PMC
Message-Id: <716C1159-9317-4362-BCA2-59E052D5C944@gmail.com>
To: openbmc@lists.ozlabs.org
X-Mailer: iPhone Mail (18D70)
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

Is OBMC ever used as firmware for a PMC (Power Management Controller)?

Mike

Sent from my iPhone
