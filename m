Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0CE158D8F
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 12:30:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48H0vB30kmzDqK3
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 22:30:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=ckimchan17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZxAT3wkq; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48H0sz3kbYzDqJY
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 22:29:22 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id m13so1129703pjb.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 03:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:subject:message-id:from:to:mime-version
 :content-transfer-encoding;
 bh=2CHUR6h9N13ijSAIRSvcx2LshCokYFqCdgHbUB1G20k=;
 b=ZxAT3wkq7LgeOzR3kBsM5BcH6sRFU67lZExeIq6bg0kueJbuxyviXHNKUh/E6YoVtU
 6CO7QgTWml2FarZGPNR+Q2JYkCFdRNhR/6yVS2ixDWIavc8Z4iWKRm4Y7lWByN08JG80
 5qWzoX7eIZ2amyGg1MFxgj3DNU1pwFiVj+ImeydVLMwETdfxrtdDVwKszjaPV5AhKDdt
 4HHxfJGS73HPQW1fpA3OJw+IkhjNfg12TUGmr/xHNgmmRQGYOCSldpBmjQ6TwAhgPMqT
 IAXPCeDhlzI6PewO2aq89LdqRluj6kPRqIH7FTXEXwl6ZAW62C7gP8YRcBQiEqXgR4v7
 l3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:message-id:from:to:mime-version
 :content-transfer-encoding;
 bh=2CHUR6h9N13ijSAIRSvcx2LshCokYFqCdgHbUB1G20k=;
 b=iLhoHcuQLpBBmA0dQcT0MhidlDlw8s885IzwKrh41OW3ynLHfmf205aAhfTgoV3aji
 51N3fFvzEZ6ovnBITroq+ErSGHpEs9wQPbC6ThN1Prs4eP1+5uz5MRWbc2Lb/NvhM7Aw
 2k8Tozr52hlv9x7OA5ghQWqMxn3r9NamWyUpKDHsCj9eZLb61x1TN6vxhTBTXkfaKdlB
 A8UdYfpyO1kyCP9gnidjyOADoQIKNNiJgZI9GozjGOQ9OnRkg3Q6kralglsQRLtWZbml
 6qihCFX3K/ZjmWVP4E1/jJu0yU/NXeFQgWq+WNGhT3q4WwZ2Z+Js6KlhpcL3eARHb7vE
 u7uw==
X-Gm-Message-State: APjAAAXHXyakXp60jYHIACdD4Q8ZYCNib6f8Thn77fkf2fHBjiFlwswF
 myCdUIQEbYoluovxbIcADK6heZBH
X-Google-Smtp-Source: APXvYqxa/RG/J++SDRNaRrE3OtOzGO5aLeFBbQA5+lq1TJw23NfSK+apOZzIOPA+x9PBHAmy7G2+Bg==
X-Received: by 2002:a17:90a:8a8f:: with SMTP id
 x15mr3177683pjn.87.1581420557459; 
 Tue, 11 Feb 2020 03:29:17 -0800 (PST)
Received: from ?IPv6:2001:b400:e2ab:e5e1:921:b02f:d336:6b0f?
 (2001-b400-e2ab-e5e1-0921-b02f-d336-6b0f.emome-ip6.hinet.net.
 [2001:b400:e2ab:e5e1:921:b02f:d336:6b0f])
 by smtp.gmail.com with ESMTPSA id f8sm3954692pfn.2.2020.02.11.03.29.15
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 03:29:16 -0800 (PST)
Date: Tue, 11 Feb 2020 19:29:14 +0800
Subject: skeleton
X-Priority: 3
Message-ID: <-3ba5uk-q8utwbge8025-qgehlm-fki8rr7khfu1-p6nczl-6suqdm-6kinuh-56lojropdia6g2uvvm-yjw858-7vs2zw-7n6ouz-c58rf1jalry2-ykhwcn-gv83n533ioofq6fq28-2f5aeoa69232-g6kqx5.1581420554253@email.android.com>
From: =?UTF-8?B?4oCq4oCq4oCq4oCqSmVmZiBDaGFu4oCs4oCs4oCs4oCs?=
 <ckimchan17@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64
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

PGRpdiBkaXI9ImF1dG8iPkhpLDxkaXY+QXMgdGhlIGRlc2NyaXB0aW9uIGluIHNrZWxldG9uIGdp
dGh1YiwgaXQgd2lsbCBiZSByZXBsYWNlZCB3aXRoIHByb3BlciBpbXBsZW1lbnRhdGlvbiwgd2hh
dCYjMzk7cyB0aGUgdXAgdG8gZGF0ZSBpbXBsZW1lbnRhdGlvbj8gd2hlcmUgY2FuIEkgZmluZCB0
aG9zZSBkb2NzIG9yIHNhbXBsZXM/PGJyIC8+PGJyIC8+SmVmZjwvZGl2PjwvZGl2Pg==

