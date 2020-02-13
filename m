Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3234215C080
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 15:39:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JK0W4HG2zDqVm
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 01:39:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OigXJYM8; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JJzm6t8TzDq8g
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 01:38:58 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 203so4411405lfa.12
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 06:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=w+0kcWGGSmUslv2fgK0F+U2GemRGPGDmAIAtq4LYbQk=;
 b=OigXJYM8lxVSgDi0lnkMokJuN/068rikbE46gd9jXR8NGugRO6dH7dHRAXbXT/ZMZJ
 Kf9Q1v9NLMAwjVMqSb2RtXPTsBXlDUML/RY9bqrw1p2TsRBfS9LfiyzMRosEL3sVJjwX
 VIqkby0kipU0ATTXh27hDNs+kdmlrrKu7YK3KXIuAZCpbAqR/3db69f4Z8ubWemEwbLH
 mlB65g7rTUnT0J0mVkf3XfeN+ExVOs3OVaUluQTaVpbfwlXWK5VZhSKhCeB42IEjb/7E
 aqOWi12xh2yfpVbvZmascID0QHRqPpyteciPzkUlCIio4hn0lEelrNslAbPsjh/OZWmT
 5uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=w+0kcWGGSmUslv2fgK0F+U2GemRGPGDmAIAtq4LYbQk=;
 b=f20M5K/EuOtaMmAaBNGxR+sjFaMcDyadSg4KG1ooF0PMBIn6Mc7AFf4TW8itc+2rqT
 K61qoYsQTjTPWQdxfiH1GaEtMlIdOr0iJLrQ6vKmLhy6nR/ErV77NXgNmtQRoYjnJvpR
 9mMypj8NHFJYIZQfIKmFib4+ZlKDqQx6QjO/hlRE5axrpra4v3rzb7Ck3KgCC/wzz93t
 bf3QI93r2Im5x+dXgeovxwM9mvhuTmL3o3pDz1Sd+qLpLPtHNV9vfaxEw69wDLLr0ln5
 pKfjYUfJORHv/+SMww4PzxWlwFBaiUzL0Sz/jatQUssRPIEHLZTYjoXaipgeIz0D9Pww
 fQbg==
X-Gm-Message-State: APjAAAUUxZFFDTZ0spGysib5KX95RnBkQF0s6X7FVj4IH24GVHHt4k6H
 pVfYRZN8PvuEY6G+XxgBVLoDNjuB9gYE6TFVFXsp+d2UIGlCEA==
X-Google-Smtp-Source: APXvYqyj2jCPcpKFjf/B7KbILk0e3Xaf0YHgb0nA8ClkiedyJIuE7YHG1q6oZGVLGKrTXQPxcsaXMTfXqibOxkqAug0=
X-Received: by 2002:ac2:4436:: with SMTP id w22mr9457546lfl.185.1581604730600; 
 Thu, 13 Feb 2020 06:38:50 -0800 (PST)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Thu, 13 Feb 2020 22:38:37 +0800
Message-ID: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
Subject: [sdbusplus] To generate a common header for public information of
 interfaces
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

Currently, sdbus++ generates the server code separately, and in
phosphor-dbus-interfaces, the separated headers are installed, and the
separated cpp files are combined together, and compiled as a library.
The public information of the interfaces (e.g, the interface strings,
the enum strings) are either in the separated header or in the cpp
files.

The result is, when a phosphor service needs to use an interface, or
an enum, it has to define the interface string or the enum string
manually, and it happens everywhere.

How about
1. Making sdbusplus to generate a "common" header for each interface
including the public information;
2. Then phosphor-dbus-interfaces could generate a single header file
that includes all the public information of the interfaces;
3. Then the phosphor service could include a single header file, and
use the interface/enum strings it needs, without manually defining
them?

There is an initial concept implementation:
* https://github.com/mine260309/sdbusplus/commit/78cb63fb7e1ceb62165c71e15779f23f7e9f166c
* https://github.com/mine260309/phosphor-dbus-interfaces/commit/6079d25547f0143fc7562a1c7ee6beb888a66432

With the above changes, a service could directly use the generated
interface string, e.g.
`sdbusplus::xyz::openbmc_project::Software::ApplyTime::interface`.
In the future, the enum strings could be put there and thus we do not
have to manually write the long full qualified string.

Ideas and suggestions are welcome.
