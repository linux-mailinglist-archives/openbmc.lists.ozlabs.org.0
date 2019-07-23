Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB472578
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 05:44:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45th6b3kBHzDq9Z
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 13:44:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CHNRKsYB"; 
 dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tBLf66CnzDqQH
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 18:23:06 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id v18so40142545ljh.6
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3aOS12p/Uregjf9QLVDPdJeKnJv89FwswvFsPLoj90o=;
 b=CHNRKsYBleAXmfF4hNSYwnpqyRM8pnbWOYWoxGc1KF2z5FrkQVn+rs4IVJBlcKVcbu
 60N/RA5wz7geuLTM0ylC7eECs+LxA0Ii660h4TjYsZhUNo05W961MESgSpM4jau9xYji
 QbX2SSVcsMMQf4jHPVhRsuPwhNMhXHRBCm/rgflGa1IH/ExQVHUKw7d9GTfHvxj88Tmy
 ZXOXGnfR8pYQJtzkmerxuiuydgSPR+Q6mcSuicu1MwJw6JQnRUJ277YtV0UKXTHxa+8Q
 VpWRzpB4kkXTAttCHJAtZ+oBbq5FazNyJJi31tucO8UMOj5ztQnFu02UUPXWBGcc6sTC
 vCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3aOS12p/Uregjf9QLVDPdJeKnJv89FwswvFsPLoj90o=;
 b=dc3+OkXmbZDYAdg5JU0tZZEgfhTzSKn3IZOVJVT4mCDPq8rFTGXKQz05xnQ84sk3mZ
 9WMTGdPwYBZD+Lz1FsZ8v692eRku1FT+pDyPHWVxGVnqlZRuiTrMzhKS3CJivxgvQm54
 6mQZNruoAFO7+Yr+Px1h+fXGkh1synG/g8f+QSA+4rq9CXincaiWBiLhOdHEKpXCzazr
 qc6caBfMJ/x2WclOefIEbq4ArF81AE7Qi2OmBS5th+VjS0qhwAd+2eBh5hputurdhogk
 xeHZq+VhuqTNDXCd7FjzgGAcK7l2JwnrduBasa7GFEEbfSJ8yAP6psGYJ32YC3Aaqa5/
 QQUg==
X-Gm-Message-State: APjAAAVmloeBSKexStscbOE86lmt2DS6KrBn7xB4P1MGix39LiofQIs4
 liudJFIPVJlQWFoubtE770EPI0amcIK3I32hrOQfs2Vn
X-Google-Smtp-Source: APXvYqwIahWVOxkHO0VfuWxPJcTWKF/4ogFpXn5JpR8f4/NQLrRnjqskuIfJqJA+XZmM9vpItYictWF343rDnP30viQ=
X-Received: by 2002:a2e:480a:: with SMTP id v10mr37279761lja.94.1563870181814; 
 Tue, 23 Jul 2019 01:23:01 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzhiqiang8906@gmail.com>
Date: Tue, 23 Jul 2019 16:22:50 +0800
Message-ID: <CAHkHK09bSzJZ0eRPYH9cd7SOB4bektv4uK1WO1=dEcTec=jxTg@mail.gmail.com>
Subject: How to switch pcie/ocp Nics for ncsi
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

HI,all

FP5280G2 BMC MAC0 is for NCSI, and there is a
separated GPIO to select the NCSI to connect to PCIe or OCP

                                        -->PCIE
mac0-->mux(TS3L501)
                      ^                 -->OCP
                      |
               GPIOH7

I want to switch pcie/ocp NICs and preserve the state bewteen
BMC reboots and AC cycles.

My solutions is:

use gpio-hog, and dynamically modify the dts file in userspace.
But maybe it is a bad choice.

are there any good suggestions?

Thanks.

John
