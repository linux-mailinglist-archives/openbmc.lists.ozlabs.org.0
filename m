Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE29FFC4
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 20:31:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tqqw40qSzDqNT
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 04:31:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="l+KIcYY4"; 
 dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tqq93MrMzDq5n
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 04:31:16 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id e6so7237187pgc.4
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 11:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ONVo/256UhPeXH7b6FAPVPIUoNbECPGmhMFY85gzlJs=;
 b=l+KIcYY4UPKDOjKTvQ7tM1Ros7hEIjLc8vri3CNRwKQLxGvFL9rw/o1zGBbXq/MLSB
 PfMEKeZxr6Bb5ni+A1PLhcvSYd57pE+sQl+0D9wg56w0gLHzGSlKDwfPb6FHMSPDs026
 gR1cQhMhJcauz1nTHG0BENbNR+l4Nwx+f9um7WHaGwCY2ZAmZeCP9O8zgwnKOys1On29
 cVRNYgc2BGIzv4uGChhlm/vOnXUxKdBRbXiY/KxwWbPZls6+lBuk+mwX7BlK9DC3y9cO
 B4IfgjtYxukA2yIqiGsBqD3OIBU5XNQ9II+6p0JNhZ19IBmZyGTjakvYwo9hluS7UUyV
 aTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ONVo/256UhPeXH7b6FAPVPIUoNbECPGmhMFY85gzlJs=;
 b=UY7FM7yN9JMaXiCIZeJjZQjwGGCgjMSN0ExEeN83LLt6ePT55tZjEqWlDGNaffhSQZ
 cwKoVZDm6ZYqFlEiwG9KG/5P3ALO9yz+WXmmjYPbLrJI8Yz2b18tD8pnapI58OISS+zL
 l4nStNN+OStTDoSgA3tTxszud9NBuCj3affuFUiFgOgHDmtDJbtXEycyzEQHhiISP+sS
 kHAqruQ/9rwUCgRVPCmyFYaUQD1dTaaqkXa1VVHNM8WFYFbvCfkswDZrWusKndek/FL5
 ZM52/cEKUiihd02jMB8Moyui2DupVga7/5teRNlwSVNrOFnZxDD5pQIkQLFhho7Ps4Lw
 +7ew==
X-Gm-Message-State: APjAAAWJ0iGlgLqHcVAsb0PZE/ak98bmb22Ue6Yy+Q0OxWWLl6IbcyVc
 NS7NDE9kWZQQkxBHiqjcfIuZDoLl82Y+BXIKRT1JkA==
X-Google-Smtp-Source: APXvYqwVN8wbx1ukpGqpoYLBLlKmKmPoWwgBQOpMHnZR+++aqrPf1p+iea7K2crsG9hQio2jo49Y8ZlrcDs8ut2ru5g=
X-Received: by 2002:a62:864a:: with SMTP id x71mr10961374pfd.228.1556649072750; 
 Tue, 30 Apr 2019 11:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <303477D5-BB35-4FC8-98FB-9C59A188064C@fb.com>
In-Reply-To: <303477D5-BB35-4FC8-98FB-9C59A188064C@fb.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 30 Apr 2019 11:31:01 -0700
Message-ID: <CAO=notzKTpC-6zAGODatyDJL5p1Y3+mW5-LbxRh7qtg1hNmufQ@mail.gmail.com>
Subject: Re: Phosphor pid control
To: Vijay Khemka <vijaykhemka@fb.com>,
 James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

+James Feist to provide assistance.

On Tue, Apr 30, 2019 at 11:30 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> I have enabled phosphor-pid-control in my image and I see following log
>
>
>
> Apr 12 23:22:43 tiogapass systemd[1]: Started Phosphor-Pid-Control Margin-based Fan Control Daemon.
>
> Apr 12 23:22:46 tiogapass swampd[1072]: terminate called after throwing an instance of 'std::runtime_error'
>
> Apr 12 23:22:46 tiogapass swampd[1072]:   what():  ObjectMapper Call Failure
>
> Apr 12 23:23:04 tiogapass systemd[1]: [[0;1;39m[[0;1;31m[[0;1;39mphosphor-pid-control.service: Main process exited, code=killed, status=6/ABRT[[0m
>
> Apr 12 23:23:04 tiogapass systemd[1]: [[0;1;39m[[0;1;31m[[0;1;39mphosphor-pid-control.service: Failed with result 'signal'.[[0m
>
> Apr 12 23:23:13 tiogapass systemd[1]: phosphor-pid-control.service: Service RestartSec=5s expired, scheduling restart.
>
> Apr 12 23:23:13 tiogapass systemd[1]: phosphor-pid-control.service: Scheduled restart job, restart counter is at 1.
>
> Apr 12 23:23:16 tiogapass systemd[1]: Stopped Phosphor-Pid-Control Margin-based Fan Control Daemon.
>
> Apr 12 23:23:16 tiogapass systemd[1]: Started Phosphor-Pid-Control Margin-based Fan Control Daemon.
>
> Apr 12 23:23:17 tiogapass swampd[1145]: No fan zones, application pausing until reboot
>
> Apr 12 23:23:27 tiogapass swampd[1145]: New configuration detected, restarting
>
> Apr 12 23:23:27 tiogapass swampd[1145]: .
>
> Apr 12 23:23:27 tiogapass systemd[1]: phosphor-pid-control.service: Succeeded.
>
> Apr 12 23:23:32 tiogapass systemd[1]: phosphor-pid-control.service: Service RestartSec=5s expired, scheduling restart.
>
> Apr 12 23:23:32 tiogapass systemd[1]: phosphor-pid-control.service: Scheduled restart job, restart counter is at 2.
>
> Apr 12 23:23:33 tiogapass systemd[1]: Stopped Phosphor-Pid-Control Margin-based Fan Control Daemon.
>
> Apr 12 23:23:33 tiogapass systemd[1]: Started Phosphor-Pid-Control Margin-based Fan Control Daemon.
>
> Apr 12 23:23:34 tiogapass swampd[1183]: No fan zones, application pausing until reboot
>
>
>
>
>
> I have configuration defined through entity manager. What is the best way to debug this and modify configurations.
>
>
>
> Regards
>
> -Vijay
