Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D5D3DAA
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 12:48:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qPn94rXzzDqY1
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 21:48:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mBheWcv0"; 
 dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qPmQ4dNkzDqXK;
 Fri, 11 Oct 2019 21:47:31 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id m13so9306553ljj.11;
 Fri, 11 Oct 2019 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=31BcLeQEagEp5TVXh0iur1VAoNKfDNPjvckJPmg60Ao=;
 b=mBheWcv08QCLp0iBOPlr+zoLhSVVohgIZPjZH6E3E6EAfcfubX/FX2iZcl33CERAp+
 w/XYOPXWkPBR/LSjAfVPmz+mdPrs04DFsp4Za+ooDbjc3rvwQZK12bIt3TIIfNKMK9RS
 t4tV+8AdwhytKUZcOdwALyRH5aTlHOvPkA9+gpL7d4AA1+zBMs36cuBDz1zjajZ7MCMJ
 ubd7XD4uf5aG+JfQNUfIoMUsEZ6IWI3DV/iYloEum7iuHBSs2hBnCjNmCZsqWbIsfkVI
 04VhJ6lEr347ZUZJykCvaDXG2/vcmZl7ICy+Ua53/UJLM7+qdFlWf1xp5uyIQp16ugQr
 7RxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=31BcLeQEagEp5TVXh0iur1VAoNKfDNPjvckJPmg60Ao=;
 b=g2ib5G9mqCYP5rWtkcG6AU5llGFeaCYjVRD81GwujbENP/7C/1a/kesXJoMwDeuPlu
 LBfJVLxGZXYGSm4iXtz+Mg+qIglpR/NPBB6qcfjmY5C979xARL31hkpYXY3B5uLiWBKa
 lm0+i0TUHftsZGTP+V5e5uWoxKh4WiNLdeUzzDB4EbBQz+zOA/ddmmmxBti0FC8dIqDo
 7AopgFKUonNxDaa0yvlV+B6O+pEUj6lhQvAoCh317itsO5P5JIHAKO31I7lHpL9cQ31f
 MitdjauZKEnPXPs8PvxG/Mq5idezmvs1ZkqTsrxwU9ydkaGZHnATbCigAmMdNg1MPuZ0
 TK/w==
X-Gm-Message-State: APjAAAWN+opfK/wV4dCH08TO4a8wqZ1gnMx8biv/B+SECLl2Mcd0yBfX
 H+Jl2xlrSYL7pWzAjoTMjbg4ctydEz8=
X-Google-Smtp-Source: APXvYqyYbV3pfhQKYd5vjXm0nJjCyoaB0b5G95G4hjelKFp11g+rU8K9XEZqdm6+1mMfZoulWOLqdg==
X-Received: by 2002:a2e:9b12:: with SMTP id u18mr9296851lji.142.1570790843816; 
 Fri, 11 Oct 2019 03:47:23 -0700 (PDT)
Received: from gmail.com ([89.207.88.249])
 by smtp.gmail.com with ESMTPSA id w77sm1929685lff.49.2019.10.11.03.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 03:47:23 -0700 (PDT)
Date: Fri, 11 Oct 2019 13:47:22 +0300
From: Artem Senichev <artemsen@gmail.com>
To: openpower-firmware@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: OpenPOWER SEL/PEL/HBEL parser
Message-ID: <20191011104722.5kqe4gl6cdk5wijx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
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

We created a parser to decode error log entries generated by OpenPOWER firmware.
It is something like `errl` utility that can be used in OpenBMC.

Source code:
https://github.com/YADRO-KNS/openpower-esel-parser

OpenBMC's recipe:
https://github.com/openbmc/openbmc/blob/master/meta-yadro/meta-nicole/recipes-phosphor/logging/openpower-esel-parser_git.bb

If you find this parser useful, we can transfer our repository to OpenBMC or
OpenPOWER and continue to maintain it as part of one of these projects.

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
