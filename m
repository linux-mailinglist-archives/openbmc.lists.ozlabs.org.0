Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15705569F3
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 15:04:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Yjsc6BtJzDqY7
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 23:04:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ayazI42l"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Yjrr0bPyzDqXK
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 23:03:37 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id i8so2388799oth.10
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wy3Njol0U19ErIGaeu5Hg61xNJclSB8dp9Gys+MAHy8=;
 b=ayazI42lGQ/dekM2gT9sP3d8iNX5d+o6vobeBVzMobqWmVdQSAVQjHso7C3S7FgKiA
 +t13ZDTT5WcJHSQNuRp1DscfmIdJJ6Gnuht2ym5UWo1YNv9SdUOeDk5QS1EHwmksVRtX
 obFLxMQ8Q0yPrYCmt4JnoSmT+bJHImDQMaI33UI8iRJKcyF8oAwV52/6lkzZNJtzS6l9
 aD4etu3dQ9jubRMWDoTqemV9zqQ+dOoDhm5aLU/h9ag3KeNJHk+s9uuUPmtCFfCS1Bzx
 2O7d9F9D5+oFG8lBurBKZHhheDy0aTWCTHlbW0Flpo+zqQBBxs9uU582eoP76/Dc4fAx
 zfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wy3Njol0U19ErIGaeu5Hg61xNJclSB8dp9Gys+MAHy8=;
 b=Kj326v1J9dtgFvRIceFxWGbVRPV5jhXUwHpn4k6gbtaOdDjbZH82XbZ5/EwyBy61ne
 +eoZpMCpqugrYYasnRozYDtuo1vOzXnyTsI4f53Yf4fG9Fh6m3nFZvOYs7/5O/uGlOx6
 LKcF8i9Pa6ScfompLSniVhlxK6pLZbEE8MO/dpNDpn/PF+ESGJWY5LrilMMmPqVfWoNe
 jLEq6+X/T86ViKSO/Giavv/+z+rGEwql0cNZkeL3jxy0hmjMIV3rKJiYZLfveerf8rYR
 4kDDVZCqpFA8HD+zcrFqI4OgfNo/CIBOJGyv8UQQVQTUIYpBy8A86npjhuVdiNn2dhTz
 4rbQ==
X-Gm-Message-State: APjAAAVyBozkxxeNcZbWwWtsY328ljeXeEf4jBcsbbujpfNIYfG2KU7s
 vbjbanf72RUJx8QYRXanRxTOyzACKFeDmn9E6Jg7Fnv32cY=
X-Google-Smtp-Source: APXvYqzb1NwZ5E8+l9m5HwuSThmM0/0q9SmcCD99aypCq+S8zfucp5KPNq5vlaom1KIrQPB08DBGuq+iHTmsqIRV6JQ=
X-Received: by 2002:a9d:5512:: with SMTP id l18mr2175041oth.260.1561554212580; 
 Wed, 26 Jun 2019 06:03:32 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 26 Jun 2019 08:03:16 -0500
Message-ID: <CALLMt=r9fPm92Fm5cZXHig+9LrrJV_VG+upDQmbojbn6iU2k9g@mail.gmail.com>
Subject: OpenBMC Infrastructure Workgroup Today at 2:00pm Central
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

It's been a while, lets meet today!

Agenda and call-in info is here:
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

Andrew
