Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9D31DEEB
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 19:14:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgmFf0WZtz3bcw
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 05:14:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TWN5/+2y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TWN5/+2y; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgmFQ65DSz30K5
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 05:14:16 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id l3so15960819oii.2
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 10:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=O5wgPSX0EqeMbJR+BLOmiQdB8oreVzSi/8OkWea4uy0=;
 b=TWN5/+2yVsVXhJhz49mXMQy7ePKvYzwJmxEkEIq7pa43DajPkwNKRvwVnYKBNnB/0B
 OJ3v1CZUTVUd/Y3DBphR9Zb4MpYWa50nkJK0g0RopZ4hjYlv7Onv0lxKfHJpSJKmYTKn
 1Yn5vvn7RIIZVh36Mq1wwtqtWVWrjVglq3yxVOKWWHjLqZ60CK3M/YVYPmf+9QloDit3
 2CGaL16vesY5YgVtEomiDcBlbkHE5S6pQCPZlAMv2Ynpu8zu3upbEUq9w4Q4nTebrUCR
 AmBwMrEBOv25IE+pksT3Thuc+1mtsLf9T2hSFuD5h1HE7OgWvIB7n8Wok7w9NTLRB6rA
 q6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=O5wgPSX0EqeMbJR+BLOmiQdB8oreVzSi/8OkWea4uy0=;
 b=panYLOVrO1Fb5H/QwpvbxxsJFq2xmK/n8MgPI1KwTgtoFpG7GRM6a8H4vAEMNHzqYa
 GoClROYVJv29r2V9++R3khElSOkijAS/cuYraF9i2WCfrLAZ7JM4Y6nnm8LKoboG8oHP
 bg15k8qItRKfgFemlBaAzaHb1MO9v3uF1uvB0y2OtawQOr9L+3qiubYaoGSsAbJVeJZA
 qgm/1X5xBeLaQnA36z/H4PP6KHjxe6JKPEc0iwHvUAliaMc011Nv5xr1DbccUq7jnjNm
 n6D7sFaCPG4jO1gFwtlb+UNgQPaSGCJupSiF4L6jNUttgMbB5gd6k0Gper6q7HTHgycO
 WCvg==
X-Gm-Message-State: AOAM531gWCXIr5PGjRtR1tpMSzyqRTLw7oecrzC9K1fzmtFqRSXr545h
 KIODli9gC0X/1YARmSMGz1nwxfNtm9RZaw==
X-Google-Smtp-Source: ABdhPJwLw/J08m57imTO91TiYt+hHuLtXAI9UVlXIyyyTituQQiHnZpar89+fQCPYt1B+iasVxtWVw==
X-Received: by 2002:aca:b1c1:: with SMTP id a184mr49659oif.117.1613585651142; 
 Wed, 17 Feb 2021 10:14:11 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:7529:b119:20bd:9ab4])
 by smtp.gmail.com with ESMTPSA id r15sm530498otq.77.2021.02.17.10.14.10
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Feb 2021 10:14:10 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: replace witherspoon-tacoma with rainier in CI
Message-Id: <3309719B-0B3F-44AC-BF30-7E7745A4BA67@gmail.com>
Date: Wed, 17 Feb 2021 12:14:09 -0600
To: openbmc <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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

The witherspoon-tacoma system was a variant of IBM's witherspoon system =
that
supported the AST2600. We introduced it into CI primarily to give the =
community
CI coverage of the new AST2600 chip.

IBM has begun shifting it's focus away from witherspoon-tacoma and on to
rainier. Rainier is also an AST2600 based system, has more features =
enabled
on it, and is the direction of most new IBM development.

I'd like to propose replacing witherspoon-tacoma in our CI jobs with =
rainier.

Andrew=
