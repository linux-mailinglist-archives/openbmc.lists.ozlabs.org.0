Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F32F6D44
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 04:22:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BGQX0mMczF4W3
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 14:22:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=wangzhiqiang8906@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FgGrorUX"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BGKf1XjjzF37K
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 14:18:07 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id m15so10086004otq.7
 for <openbmc@lists.ozlabs.org>; Sun, 10 Nov 2019 19:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=orvwqNzFta51oEmt2z6vEQvUSzUOJSumAs8LmQb0gMo=;
 b=FgGrorUXQ3gUL9DVg/uwBIfyYf3Cv12/G767CauKmg+DEsV2qkOKdljbWJJp5D59P6
 yBZYHQ12UsLjbAwZo3KkuPYL+57u7lKfLEGgmO4xfV8accI9WmXhaPQRLF47tiyE2VAk
 /A/V8+P4z7Ywy0K8ha7KDnZDYpimuc9TRX+BvJ45T1ECpKO0gX1fZDICNaQ1MjCw5fRy
 8W2M1TOdEgxMwnTAlTzdZKoCf7Vn6WSQciY/Wrxa6L2gV3ZoqvvxYvS43C7wGYbp0NEy
 bxwHqg5PlcxyB3H+oRkZsTJqUAh1N1WWi4msM1o14/71EmvY75QJ1m1JmgZ+fKMpuffQ
 jQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=orvwqNzFta51oEmt2z6vEQvUSzUOJSumAs8LmQb0gMo=;
 b=eJyH4eBDGbRF3tssPsywzjCwK/Lc2sISXqwnUd9lh39rwxhwyCYSgOLP9+FxTpA7H/
 WQs51wm2U+udLVqudoVFPaDxM+VN09nzhgpWniraQEkRPPX1locmYBq1jP+NYWKgUqKC
 BS9wYBcUB74pxm10Ha1w6dwrPScN2sYeYFmNdNi4Wdd8JCK/QqmJiPdQwJlGE6tNfgnT
 RxFbHyyR03/cjAOITCpTz+xq9b9gzqpPNRQQklsHjv74alvsdWEtTim6ePCKdWiN087g
 8/j0wp/DPIMJfbeAFA0rSYM8bsYc9NIMt4q6MB0ohgaZHqB/Ht8PJO8ntDUCsFOBQ2hQ
 wCoA==
X-Gm-Message-State: APjAAAXdze2RrY7O43hzuafglIjLOiLReA4D1zpeVQy+xjF/WgEVdMe+
 yeYWdwiMGyth7Ewq/0brCPnka2i9SvE44EYr5n/Oy1O6
X-Google-Smtp-Source: APXvYqzSIalxDjRt0J685UnKyGuw2yMIXMeUpCIprkO6nQ4qUwyb3JEB4wyzQNy+kHjhunXXseAXR3Gr+F9P4cX8ljo=
X-Received: by 2002:a9d:6f8c:: with SMTP id h12mr18912119otq.257.1573442284176; 
 Sun, 10 Nov 2019 19:18:04 -0800 (PST)
MIME-Version: 1.0
From: John Wang <wangzhiqiang8906@gmail.com>
Date: Mon, 11 Nov 2019 11:17:52 +0800
Message-ID: <CAHkHK08UNBHTbqHAC71f-hVBuLJNNFiGoX0eGmV27YaoP1+mgw@mail.gmail.com>
Subject: How to configure i2c to high speed mode
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

Hi,all

I did a test and found that if the firmware image is transmitted via i2c,
it's too slow.

The test I did:

*slave side:

use i2c-slave-mqueue[1] to receive and queue messages from the remote
i2c master device.  the driveri's message size is 120 bytes,queue size
is 32.

*master side:

test.sh:
#!/bin/sh

for i in {1..30}
do
i2ctransfer -y 3 w100@0x10 0xff-        # send 100 bytes
done

$time test.sh
real 0m0.789s
user 0m0.076s
sys 0m0.328s

Then 30*100/0.789 = 3.8k bytes/s, it will take 2.4 hours to send a 32M image

Could we config the i2c to high speed mode? if so, how to configure it?

Thanks.

[1] https://patchwork.ozlabs.org/patch/894425/
