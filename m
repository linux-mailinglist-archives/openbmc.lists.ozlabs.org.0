Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 204BD752A3
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 17:32:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vbnJ36xdzDqQx
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 01:32:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BuHMAD8h"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vbmg6p65zDqPS
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 01:32:03 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id s20so52052172otp.4
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=EiZw/JCEByOSncwUtazdIOoK6gwRzIiWzI79A9s8MFM=;
 b=BuHMAD8hWoGV80UsjlGxWohTVP9ouNgQAtMz0xF+0F1OKtckkalVRgVsXU89G2QFLX
 d4hc07bP+PL+2maCxfX+9ZDIThnQ7tNinnFXReTZy/FNpFguVtQ/jSoSWH6AABCFTj/3
 E7PFk7tLeKd+GIw5PinXrc+Vo2S8s+6N586ti4jHnUCU5Se2ltahEf4SK6dRTfOjaJH4
 cqL1CtmnW3yMQiKqI3c9mpMlmBh7yKuW5fBJiA84KA9cYQcQdqY8iWwAD7lC/rZtJAVk
 Udkdt1Hxf6xB/J1yG4fL5RjgXpEt0aG1ZXubMQFLDrtsezK1jWZYj/r1T6IEGoG2KyRn
 Omnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EiZw/JCEByOSncwUtazdIOoK6gwRzIiWzI79A9s8MFM=;
 b=GVKkPo3B4lA9q47CWCW995xSJcGTtyw8IY/akN1HX4CAP7PgCULaIfYGrk3arcwpHL
 A+wcSuuHGA6OgwycdTnY787nvzS5TWEGIZ6VsW/0hLg7UD9Qy2WRl9WUVroJZL3r+Bqt
 7cUfiEEuiZvAqlvTb5Sa7wEbo36mhSjwW0kuVMF70kE4Qkdrx1KbvFiPS9pl16B4ZhtP
 MBeoqXnWAW9rop4XNWoL6X9CPc1OrMfgkPrYkeM2sksKe5H173AITU4BuA+BUCdEQF5q
 jZTfUgnRAueU49XKblnIn27lT6eW8LRTep1dvu36KSTqiQTfs2/8RKBqkVb8q0RJsJKo
 zzew==
X-Gm-Message-State: APjAAAVhg5VPt8BtTlSTg67aqIu7yk/ONwF14nutNWYswV1KdYLmXHwd
 0UGle9CqKxQQ+jF9X2qNrm4mk2KQ2Tqp0+e0+4PFPE7i
X-Google-Smtp-Source: APXvYqx/UNYgkid2HE0kiL5lfZGJ/eDCUJGyBU9m5qbj/SsdIfDzPi5ac/Q7TqE1noM1Z9W6zN0S+Zaockv5ATRsVO8=
X-Received: by 2002:a9d:5512:: with SMTP id l18mr34216249oth.260.1564068720920; 
 Thu, 25 Jul 2019 08:32:00 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 25 Jul 2019 10:31:45 -0500
Message-ID: <CALLMt=rPEUO80HSivQYY9b0WuaxM_8LwTkPxyySADVxL1A4j+A@mail.gmail.com>
Subject: journal log of boot requests?
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

I intermittently deal with issues where someone comes to me and says the
"BMC is randomly rebooting my server". I then get to peel through the journal
and look for things like this:

Thu Jun 27 10:45:59 2019 witherspoon phosphor-host-state-manager: Host
State transaction request
Thu Jun 27 10:45:59 2019 witherspoon netipmid: Transition request
initiated successfully

And point out to the person that it appears an out of band IPMI command
actually requested the state change.

Certain paths like a external REST/Redfish commands or I think an inband host
initiated reboot will only provide the phosphor-host-state-manager entry which
makes it even more complicated to debug the "who did it" aspect.

You can dig into the details of the journal entry and get the request but
I think it would be nice to have a little more detail in the journal from the
server side application that gets the request.

I was thinking of adding a more detailed journal log in ipmi and bmcweb when
these requests come in. I know we don't want to clog up the journal but state
changes to the server are a big deal IMHO and should be fairly rare.

Thoughts?
Andrew
