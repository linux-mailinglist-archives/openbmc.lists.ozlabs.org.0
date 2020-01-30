Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3957714E544
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 23:01:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487vSt4hshzDqcc
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 09:01:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nn2juqqF; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487vRy03swzDqbl
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 09:00:43 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id 66so4609408otd.9
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 14:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Bc/vEN9G54FafOguPdTco6es7FqtYWaMqNkTBPpZXI4=;
 b=nn2juqqF6mgCYmqcpdnoFzM3WfWbzmv4jCgcldacsesAXqqJPPDbPBPIQkTfc8rI8O
 bFII8F2x+mcLsoJaTwNCZloCtFt4kt1Eh1NS5Gvoz/GzEAodNHE4x3IeCPjRWXb8Rg57
 wPI7Sf3tWzAmJ8UZxuT7uIdnPIFl1ri187+3QKCsccH0KsOggwQOQbTVmqR9AXJ+KbSp
 Z+hzxUKMcqkmq8fJaWiBN4TBOXd4pQPQkw5XbdiVvY0sBbjUxoEK63Nn18ctoWuuOdnA
 2hy8uZ1Mib4Z6K9J1V497Pj0tXWdlomqu/UrK4EcbNoUStQB79WBUIt+/RI3aB0zW4CK
 ZjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Bc/vEN9G54FafOguPdTco6es7FqtYWaMqNkTBPpZXI4=;
 b=pDmKIdwChV2d9RJzmyPBqGWVgmqvWxVq763WMWohh0kzf9bzitbSWt6bjcb9xE9HUK
 OKZdyGbFwE5nBWnnLq6mlFT6C8z3tmxIEPPtR0FaHf8MUHtKS39Rs4Q+eJvOBIw1eNkA
 dE5rHxDa4t2P8fXtlUn8Tqae1vawf9DtjYZiDK0cB6DPtYJZ4kTJ9M9Dja+alqCYZx25
 SFjHVw6idC55J1x05DtbbbUNoMrSV9hABhdyqeu0C9EaXn8lHZ4VHgV9cP1LSQhfwpoF
 fryiE8QChLtpxjv94RQcQrHPNOSsljAjEDwGjbOOXvgy1BahP9KHRT6SeFje9Nma6icZ
 eW1Q==
X-Gm-Message-State: APjAAAU3wnyBkaHkQvk8FAwLMMDiKO/7ZeIO1TjSNJcmq1voNqKBEZ3/
 fB9DZb9u8ogHwfXQ47hqffdtRQEG41W7IixEkmmrEJm/+cE=
X-Google-Smtp-Source: APXvYqzaizeTKdhkEU0JqxAkrjCKJ5tgzkairr8GIT1UF0+l0YwUxL+e8vXCkWBTEHTRfDbCkMjZe0pkOfVw4/o95ps=
X-Received: by 2002:a05:6830:112:: with SMTP id
 i18mr5484340otp.209.1580421640159; 
 Thu, 30 Jan 2020 14:00:40 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 30 Jan 2020 16:00:24 -0600
Message-ID: <CALLMt=oVNh77EyNMUDkY6zNcCmO4Dy+ktB9PwvdNN4NO5PBGLA@mail.gmail.com>
Subject: enabling core dumps
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

I've put up a commit to re-enable core dumps within
OpenBMC:
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/28904

Feel free to weigh in.

Andrew
