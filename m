Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0909F1F503
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2019 15:06:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453vvM1jklzDqQR
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2019 23:06:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UaKKDCnJ"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453vtF0CB9zDqNp
 for <openbmc@lists.ozlabs.org>; Wed, 15 May 2019 23:05:23 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id 66so2186181otq.0
 for <openbmc@lists.ozlabs.org>; Wed, 15 May 2019 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NvNArgvfVQGs2NZjexYtEM9aDUqUSMdvCn7IY7A+6j4=;
 b=UaKKDCnJBT07hzjQ2VOYi940U216XyAIhoK+UocJlPz5m8bVT7Fbhj6s7DYJeIoqhu
 ewbon64kCaNbt3fMDUFuMZ65X/qb9zpdCi2A6/Up7ivR0Ko06H5j0mkIutuG88oIZjc6
 cE5zi6BliKw76Zq4L+U3IX/2WX+PE0OhUbUnq4cXkGPrPbrbK+oqLOofUsW6XLLSgkb+
 0X79IAsoZA3zu3pAmqFr8oa2kswwMU9BXU7TtxO/eaWpKHfh4u7l01SAkSrqZ/loqdjq
 PQfJjqustFyLsWg8Ot6o5jZfQrfK6BwfIYW9NFoAxh4uY09YINMB0FTRlZGuKrz4HrnF
 qamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NvNArgvfVQGs2NZjexYtEM9aDUqUSMdvCn7IY7A+6j4=;
 b=mOFm03WAbWBJqmy/0wYZLBM0himOpbbYcN7Wnub8MiD6DROFuX0xSBhE0Blt0j0nli
 Bj2NZUS4//en263ato+M21LOMTSUIbYcpf3xuNHvEtHQnFPi5wMnbcZatHHY0Om2jnbS
 /xuLUj+gQsJ7ID9FlW/27/b6TS09HgiVHTXunZBLlb+pVK9CPOXnJ0HaeGZk4Sirp+SH
 HVGHpIgl6Q/kb62YMw27cbqu7k9ieKxDcK0aweX0PSnLMvTCdaQiRKrolstdccmKKwsb
 Qimg3I6PebEHJDvgf4DRYHOwBXSIOHP1SZ8sZibGqA/XSQo6wsyrJA8/XDnATstQJqI0
 hQOw==
X-Gm-Message-State: APjAAAVg6P3U6tyKN7de0K2Cd3jtQ0bBJ5vxRxlpUL+uBYjgr8avz9VX
 97VCktm28omwFMZ5DZrRhhfy/hckBTodYCqUP+C990pPaZ0=
X-Google-Smtp-Source: APXvYqyUKF9/FrsL6zQ4F69/FtA3tZxSuSyEFCMiYTIgE06/rYvPCniqRlG4ewp+dZOYrA0gjztqhv2rjzVtfe/9KcM=
X-Received: by 2002:a9d:1b6d:: with SMTP id l100mr4711946otl.15.1557925519425; 
 Wed, 15 May 2019 06:05:19 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 15 May 2019 08:05:03 -0500
Message-ID: <CALLMt=r_03Xbm0beXHfeEHZ7EdDdt+svtT3ti=11EtbOY4AgZQ@mail.gmail.com>
Subject: Infrastructure Workgroup Meeting - Today at 2:00pm Central
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

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

It's been a while, lets touch base.

Andrew
