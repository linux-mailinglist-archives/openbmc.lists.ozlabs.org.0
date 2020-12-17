Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B432DD545
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 17:32:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cxcw74tZXzDqYV
	for <lists+openbmc@lfdr.de>; Fri, 18 Dec 2020 03:32:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=deq1fkC+; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxcvG4XFqzDqKr
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2020 03:31:18 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id f16so27835326otl.11
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2020 08:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=78iNnjm30QkByA0dieWSuZzCzuWFxh73pGAHe1NhZDE=;
 b=deq1fkC+Sv9WZ1I74zR4ID/aSrkfVOTNgH0VE0oRhjur0P+Jn0GRCwfdjkcCmr7Zla
 q1nXj5Ns2wUEGAUNQeFGBjonduKsYnskGc+GT+jfLaVnNgcyizRZm40ZjOqq3NiFOkWI
 998VB741QUK91tsrRCCxgGdwbEKJyTHaTCwnOJRdzQv+iCPhhvi5OUv8SUOE5TjibHWQ
 3C5A6ozWBxuCGgWBVn/M9tBjyv0bwXF98ZdxdCuaMmUNv8V/twqBoPBJWc2hrcKntwIx
 gAwMcJ3r61qXR7OFhn9jC7DLirfnJDSZp/Hppcs8/iXUb6wNavVblHWyMPY8GczjcBwI
 T90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=78iNnjm30QkByA0dieWSuZzCzuWFxh73pGAHe1NhZDE=;
 b=GZQiF59eB51AQGh/aRnmytNwk6grqAewJ56Vo9KKNXrSjD76WqSynzg9qQYdpINgLJ
 bYIJSu3q5Ix2EFyjkTUVeEyCJjkA97QBIKcWxTLCDnS9Dkpw7Wep2EaWnRtEr/D8+XDD
 cIRhnHuoGrONwSMPmPsD0eMNgaxSRcSybNHv8UUiY5dTC/GXaxfdEsKXZNMqtpEigbhO
 kmZfGl3TEshCrcwXoAriQf9RsEhzV/U5bWojpBhXdVVpVpSIUVsMIULOoQA++pQzM8c7
 MwFYp4jdzIpczsBRUMgodtWtnu8tqMHlMMoOPdAwWdqKQ/yNbOs3S/EuBJsoVUFaMURY
 QEbQ==
X-Gm-Message-State: AOAM5305smSggeJT5QyrY2sJ7C+modwfkcY+2UaPjOJDqOwye+Q+2WZ3
 uHAe3678UDMHISHpaf7CaPLx2HwM3sRxWA==
X-Google-Smtp-Source: ABdhPJzfIaSha3C6U/+ZrL+bTsN+DvFoUqP6oqr5853MRjhmNv0ck3ahspVblKKgLwydECDc/YcUmw==
X-Received: by 2002:a05:6830:1610:: with SMTP id
 g16mr29876316otr.345.1608222674702; 
 Thu, 17 Dec 2020 08:31:14 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:b9a2:7aa2:2b9a:15d6])
 by smtp.gmail.com with ESMTPSA id b71sm1188262oii.5.2020.12.17.08.31.13
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 08:31:13 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: openbmc gerrit and jenkins upgrade - Dec 28, 2020
Message-Id: <C9C8DBC8-8747-452F-B4EF-4102B2A46A2C@gmail.com>
Date: Thu, 17 Dec 2020 10:31:13 -0600
To: openbMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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

Greetings,

I=E2=80=99ve been putting a gerrit upgrade off for a while because:

a) this current version has been running very stable
b) my last upgrade experience was pretty rough
c) we keep flirting with just going to github and getting rid of gerrit

But it seems like the quiet holiday season is going to be my
best time to give it a go and a gerrit to github migration does
not appear to be imminent.

I know to get to the latest gerrit I=E2=80=99m going to have to do some
database migration work. I have no idea how long this is going
to take so I=E2=80=99d say plan for no gerrit during the US day time on
Monday Dec 28 (8am-5pm).

I=E2=80=99ll keep you posted in discord on the 28th.

Wish me luck,
Andrew=
