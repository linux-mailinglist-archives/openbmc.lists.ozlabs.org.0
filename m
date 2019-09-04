Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCEA9759
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 01:51:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P0vx2wznzDqvK
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 09:51:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mlH0247J"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P0v44VbnzDqtt
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 09:50:32 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id s12so458179pfe.6
 for <openbmc@lists.ozlabs.org>; Wed, 04 Sep 2019 16:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dPPSypCOWXnwJW/qR3MzpjfKUzXBPyzaQ93aeKYAqOg=;
 b=mlH0247JilX6h/wYtxYqpMWb5JPCtbKnYaDKOVVjq1T+uE3jWpIt1OX8Z09DaysmsP
 fpEx7Zph5ez8SMmUimyXscae7nzBTQqZ/QL6Naht/IsF9wX0tLpitchIh/5lXSgPCQSI
 SHi8kIGWozYM9wKulP12jcAX29XEBVlq03dDgBPeHdq5fDQJu5aQnSuwyLO8O5BqT+Wb
 VH1goSS0kP8P/balNrLoUXl1w1m4YsAZz6VmhM+HiwNV2NcDBb56Vpl3iy6G9Rp8QqK9
 73+WZ+SwEAbbNNYVfcCKzKAVQH3oDxGaz5bQ0UOXIItvXLa0SRvt/wSA172VxAicuXQI
 0jwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dPPSypCOWXnwJW/qR3MzpjfKUzXBPyzaQ93aeKYAqOg=;
 b=mA6gqBinHoWA40UWzc6ZfupOCFbXaIQMIKBbj/EsjCH4MEn3yx9Dx61TT31stOibpI
 X4VNbGeYlmSQED5tSutzlurKCFgyypXqDtofYqJXn2C+9nufr5b1GsR+7fpXROnfmibd
 aaQoNXloP0hwoeKdegMbYVgIzenxt3eeXnbsiFqwjUWgeg+HL0ytAnnCwKqDfQTpvc/F
 o8IBRx2VWVr85QrzqQHhrrNv9EDLTikWxeliw4MxMhrJPXINB8luGE/Y1DHT9mpjynZl
 AdGl8vrRWtd7X2Huhy4TRPr+LUlFr1dTSToJDyI1mX22WEwWtA5I0viawdcwHtBz7zPZ
 Z6Hg==
X-Gm-Message-State: APjAAAUugYr+/dTZW2HXWmVENXW4XN/exl4GOClCdZUrq7JVInGRHiUQ
 WCQoE+02NdwrXLlI5yEwNf/piwhMSE0CxPPhDWOb6g==
X-Google-Smtp-Source: APXvYqx/DqoVOrcgq1nQF3A14kAHloYMGSBkdu9fqptZYNRuWxelf4/ipOsCExw1Jpbz2/JuHHmdQZ6y4Alpgr7c5gw=
X-Received: by 2002:a62:d14c:: with SMTP id t12mr321488pfl.185.1567641028330; 
 Wed, 04 Sep 2019 16:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xfzn3A7nCFqCbSm=6qsB-5dgJOcz1rgSGhRH=xojb4m_w@mail.gmail.com>
In-Reply-To: <CACPK8Xfzn3A7nCFqCbSm=6qsB-5dgJOcz1rgSGhRH=xojb4m_w@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 4 Sep 2019 16:50:16 -0700
Message-ID: <CAFd5g44dg3=FiW6QHLWtdoZzgP18ghQ0Fd40SGpBK1GYAHan-A@mail.gmail.com>
Subject: Re: [PATCH dev-5.2 0/2] i2c: aspeed: Add H/W timeout support
To: Joel Stanley <joel@jms.id.au>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 4, 2019 at 3:55 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Hi Jae,
>
> On Wed, 4 Sep 2019 at 20:08, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >
> > In case of multi-master environment, if a peer master incorrectly handles
> > a bus in the middle of a transaction, I2C hardware hangs in slave state
> > and it can't escape from the slave state, so this commit adds slave
> > inactive timeout support to recover the bus in the case.
> >
> > By applying this change, SDA data-low and SCL clock-low timeout feature
> > also could be enabled which was disabled previously.
>
> Please consider sending your RFC patches to the upstream list. You
> have a big backlog of patches now.

Joel, thanks for keeping track of this!

Sorry, for not keeping up with my emails, I don't think I have time to
continue to maintain this.

However, I don't want to hand this off in a bad state. I will try to
get up to date on all the emails in the coming weeks.

Jae, can you start sending things upstream as Joel suggested?
