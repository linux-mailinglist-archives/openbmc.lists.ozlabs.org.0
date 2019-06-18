Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD084A5D9
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 17:50:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sswz5D0KzDqcq
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 01:50:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CkyMwo/f"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ssw35HlQzDqhC
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 01:49:39 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id k8so806302iot.1
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 08:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xj85c7qM9bXS5SzW0Ewqkk8ew0S2vpMOV0UKa+p29c4=;
 b=CkyMwo/fNPydGgB5fR/yS6B4KkEvmI/y9Vfqvpw/cBzHlWLQpcWT+wtI2pbEmRLLaC
 MDe+JgV2XBU5YE9jXpV+wJRaIu6sAGFvv6EnkDGW0e3UeKgWwwNyh7Mw9TOH9ccH0JC/
 1fK58jqkHd7q30nyvHFgEFMTmBjRSu/XZHL9h3Jru4F8Glx+awvu2P+Rb/Bci6hDsIw6
 PWcUGlACXoBcoDMunXu2mvuMrxiC65yM8zco83MIt7Vnaug5HltnCCQ4E4EQPdr9B6Hv
 sM5nV1xWdpeIO7ugAfVAtbMPVh7sErKmY9MmLXDm4T0LaQyW4qcWd+uk2uaFFb1UgEEy
 KarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xj85c7qM9bXS5SzW0Ewqkk8ew0S2vpMOV0UKa+p29c4=;
 b=fldfMSuukfH+Jzfrdqw/wzczqAXrIqAy0zgeSAVBAP8XthNrP/lqVtx7ggrB/ab3Rk
 8FZsftBrVfbk662SFAsCNno7Ht4qHA8cGHdqSWALDksaJXqVHfX2/pWAOzUO4qhsLPY6
 JAO7u7V8G1+VGTvwf0xQczs6jOWv2dcf7Vqi7GJb2CElPe+IgmAsxcW1dC5MEBGi1pJM
 mJyhhkpf9o1n27kqkh59dIs1veIeFIkjALL8zBFyTU9DUZ/67ZngR8NzqGsx8vkvnNKa
 JehN6IWkE3HRbsqcmJU37IyN82iEQPngNS2vk+o3GCYgd2GW9EbTOTBIcKB9fMU4uDud
 /wLw==
X-Gm-Message-State: APjAAAWSUu58Mx/7pIK2u2YzoefiioKayVpGUTVi2WG6CFElkqpx6ggc
 8d7Wk2xOdBtx9fC8DHdYGxEyUTU1e0MV4xL+W0o=
X-Google-Smtp-Source: APXvYqwWnbr+EnXMrzt3YGTqKH0qZmDAQM6K2E7EAWpU/L1824q84xbabrptS81eHbVBZOv2How+o8zRYebFSISuTzA=
X-Received: by 2002:a5d:8a0c:: with SMTP id w12mr33915290iod.68.1560872975769; 
 Tue, 18 Jun 2019 08:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
In-Reply-To: <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
From: Derick <derick.montague@gmail.com>
Date: Tue, 18 Jun 2019 10:49:24 -0500
Message-ID: <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
Subject: Re: Re: Network Settings GUI
To: xiuzhi <1450335857@qq.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> IPV6 is one of the functions  urgently need by Lenovo Commercial Server Products.

Thank you for your response! What does urgent mean, is there a
timeframe? Does your
team have front-end development resources to implement the design? We
have a design that can be implemented, but we are not planning to
implement IPv6
in the GUI right away based on our current priorities. If someone else
wants to implement the design, we can review and provide feedback. I
believe the backend functionality is complete.
