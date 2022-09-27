Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205E5EBB1A
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 09:05:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc9cM0WpZz3c23
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 17:05:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ug/+VYiU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ug/+VYiU;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc9bv1PYlz3bYM
	for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 17:04:41 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id v1so8273672plo.9
        for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 00:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=yEm8a4eD2X2YYMlusiiwdh/+cenA36zykeoNww5YkOA=;
        b=Ug/+VYiUmelOw8hYgVk7KpErOAwRMrmyswOCrNbswNSHNgehK0ICBFUuCslD+qyn9h
         Y3uzDpW4bJnIzkRkQrjhm0qk3OVeHaW+EI5KE3rJnxUGU7Fi5oG+01H7OvuorGPgni+I
         AgSaxhJr+0Y6438U3GSZRp307aSm8VwgkPyG+B782rP05eVLo86smN0BvUinl4PgCj1b
         7GqAkCGcOOfiL0laERp3jMt5s9j7p2Z9J929E3LojNyjOHx9ffv+cYJ6PVe6nIYI1tdo
         FnVr5vgbc8D9mq+T+H6gPtwWXyJsLCejjYbSZMGj+yuwyMcQu/NZEHxZUgeyRuz0v48F
         fGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yEm8a4eD2X2YYMlusiiwdh/+cenA36zykeoNww5YkOA=;
        b=S6DcaX2B7OpQfqhsnIGBqhwrKNzmyiXkfZ9/N47WbmDSkvvka3vKFuqgDZMfV3vcM0
         shIqL9BkVXJFGuRTj9isx27rQKfziog2oiW9MIPQOoWjD+wxwuWuXe+xR13Ciy/Cl8zI
         3jk6Jely5nD+llKl/uzBfQ3/Pi6YjV20/muf6LrUOghBvdkxykKNsxGvJDnZTZWPVtlB
         l6K2PwFIqV6SHyIWvPjCXD5RRkp4Sv0+SgaZD4a1dsDaAf0VLIQeBlXRT+6gJAKPSzfo
         oDlQZwSCAU9Y6RsrRjy2fDPwNlcRkqbgZHYeYbK9RbRlG+IDLkW1sPJBW52wQSnly1d+
         3pGg==
X-Gm-Message-State: ACrzQf0kjGaBizq9N0TqvbUvX5TignhO6CHzsqauKkt6zgeehNMXAyaL
	oDv9vO8GYZvLp5H5Jlj2mPc=
X-Google-Smtp-Source: AMsMyM7E5dfNa3YbxwQOb4gUqAiZkuV3qdH+6QvDQ4qOqAr6PrDAiB9YWLW1QH9VxXnJBrC9yMjjhQ==
X-Received: by 2002:a17:90b:1d87:b0:200:b6e1:7e9f with SMTP id pf7-20020a17090b1d8700b00200b6e17e9fmr2927261pjb.235.1664262276264;
        Tue, 27 Sep 2022 00:04:36 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4 ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id a15-20020aa78e8f000000b00540f3ac5fb8sm797637pfr.69.2022.09.27.00.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 00:04:35 -0700 (PDT)
Date: Tue, 27 Sep 2022 00:04:32 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Subject: Re: Wedge400 (AST2520) OpenBMC stuck at reboot
Message-ID: <YzKggCf0Qx85I2Ll@taoren-fedora-PC23YAB4>
References: <YyuLaigEAyiYpl+B@taoren-fedora-PC23YAB4>
 <217031663833427@mail.yandex-team.ru>
 <YyznoHJ2pw1DHRsj@taoren-fedora-PC23YAB4>
 <TY2PR06MB27993612ED19D993284E8432B2529@TY2PR06MB2799.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY2PR06MB27993612ED19D993284E8432B2529@TY2PR06MB2799.apcprd06.prod.outlook.com>
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
Cc: Ron Chen <ron_chen@aspeedtech.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Konstantin Klubnichkin <kitsok@yandex-team.ru>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chin-Ting,

Thank you for spending time on this problem!

Could you please share the git-repo/url of the kernel-5.15 SDK you are
referring to? Do you see any critical SDK kernel patches that are not
upstreamed yet, but could potentially help to solve the reboot hange
issue?

BTW, below is my kernel tree, which is derived from Joel's kernel tree,
dev-5.15 branch:
https://github.com/facebook/openbmc-linux/tree/dev-5.15


Cheers,

Tao

On Mon, Sep 26, 2022 at 07:28:27AM +0000, Chin-Ting Kuo wrote:
> Hi Tao,
> 
> This problem cannot be reproduced on our AST2500 EVB with our kernel-5.15 SDK image.
> We have implemented three days reboot stress for about 1,980 times.
> 
> 
> 
> 
> Thanks.
> 
> Best Wishes,
> Chin-Ting
> 
> > -----Original Message-----
> > From: openbmc
> > <openbmc-bounces+chin-ting_kuo=aspeedtech.com@lists.ozlabs.org> On
> > Behalf Of Tao Ren
> > Sent: Friday, September 23, 2022 6:54 AM
> > To: Konstantin Klubnichkin <kitsok@yandex-team.ru>; Ryan Chen
> > <ryan_chen@aspeedtech.com>
> > Cc: openbmc@lists.ozlabs.org
> > Subject: Re: Wedge400 (AST2520) OpenBMC stuck at reboot
> > 
> > Hi Konstantin,
> > 
> > Thanks for the sharing. The watchdog control logic in the script is similar to
> > aspeed_wdt_restart(), but the good part is: system is still reachable if
> > watchdog cannot reset the system successfully.
> > 
> > Hi Ryan,
> > 
> > Have you ever seen the problem in your environment? Looks like it is affecting
> > multiple ASPEED platforms. Any suggestions?
> > 
> > BTW, I'm running Linux 5.15 in Wedge400 AST2520A2 OpenBMC.
> > 
> > 
> > Cheers,
> > 
> > Tao
> > 
> > On Thu, Sep 22, 2022 at 10:59:12AM +0300, Konstantin Klubnichkin wrote:
> > > <div>- все</div><div> </div><div>Hello!</div><div> </div><div>I've
> > > faced this issue.</div><div>Finally my solution was to modify shutdown
> > > script:</div><div>
> > >
> > </div><div>======================================================
> > </div
> > > ><div><div># tcsattr(tty, TIOCDRAIN, mode) to drain tty messages to
> > > console   </div><div>test -t 1 &amp;&amp; stty cooked
> > 0&lt;&amp;1
> > >
> > </div><div>
> > 
> > > </div><div>echo
> > "Syncing..."
> > 
> > > </div><div>sync
> > || :
> > > </div><div>sync || :                          </div><div>sync
> > || :
> > >
> > </div><div>                                       </div><div>e
> > cho
> > > "Stopping
> > WDTs..."
> > 
> > > </div><div>rev=$(ast_getrev || :)              </div><div>if [ "$rev"
> > > = "G5" ]; then           </div><div>        devmem 0x1e78500c 32
> > 0 ||
> > > :              </div><div>        devmem 0x1e78502c 32 0 || :
> > > </div><div>        devmem 0x1e78504c 32 0 || :
> > > </div><div>fi
> > > </div><div>if [ "$rev" = "G6" ];
> > then
> > > </div><div>        devmem 0x1e78500c 32 0
> > || :
> > > </div><div>        devmem 0x1e78504c 32 0
> > || :
> > > </div><div>        devmem 0x1e78508c 32 0
> > || :
> > > </div><div>        devmem 0x1e7850cc 32 0
> > || :
> > > </div><div>        devmem 0x1e78510c 32 0
> > || :
> > > </div><div>        devmem 0x1e78514c 32 0
> > || :
> > > </div><div>        devmem 0x1e78518c 32 0
> > || :
> > > </div><div>        devmem 0x1e7851cc 32 0
> > || :
> > >
> > </div><div>fi
> > 
> > >
> > </div><div>
> > 
> > > </div><div>sled_hb_hb
> > || :
> > >
> > </div><div>
> > 
> > > </div><div>echo "Setting up WDT1 for ARM
> > reboot"
> > > </div><div># Set timeout to 5
> > seconds
> > > </div><div>devmem 0x1e785004 32 0x4c4b40
> > || :
> > > </div><div># Load counter reload value to counter
> > register
> > > </div><div>devmem 0x1e785008 32 0x4755
> > || :
> > > </div><div># Enable WDT1, reset ARM core only, use first flash
> > > (AST2500 only),</div><div># disable interrupt,  use 1MHz clock
> > > (AST2500 only)</div><div>devmem 0x1e78500c 32 0x53
> > || :
> > >
> > </div><div>                                            </div
> > ><div>echo
> > > -n "WDT1CR " || :                      </div><div>devmem
> > 0x1e78500c ||
> > > :                      </div><div>
> > 
> > > </div><div>echo "Last heart beats
> > following..."
> > >
> > </div><div>
> > 
> > > </div><div>while true;
> > do
> > > </div><div>        echo "KNOCK
> > knock..."
> > > </div><div>        sleep
> > 1
> > >
> > </div><div>done
> > 
> > 
> > 
> > > </div><div> </div><div>echo "WARNING!!!! ZOMBIE
> > ATTACK!!!" </div><div>
> > 
> > > </div><div># Execute the command systemd told us
> > to ...
> > > </div><div>if test -d /oldroot  &amp;&amp; test
> > "$1"
> > >
> > </div><div>then
> > 
> > > </div><div>        if test "$1" =
> > kexec
> > >
> > </div><div>        then
> > 
> > > </div><div>                $1 -f
> > -e
> > >
> > </div><div>        else
> > 
> > > </div><div>                $1
> > -f
> > >
> > </div><div>        fi
> > 
> > > </div><div>fi
> > >
> > </div></div><div><div>=============================================
> > ===
> > > ======</div></div><div> </div><div>22.09.2022, 01:09, "Tao Ren"
> > > &lt;rentao.bupt@gmail.com&gt;:</div><blockquote><p>Hi there,<br /><br
> > > />Recently I noticed a few Wedge400 (AST2520A2) units stuck after
> > > "reboot"<br />command. It's hard to reproduce (affecting ~1 out of
> > > 1,000 units), but<br />once it happens, I have to power cycle the
> > > chassis to recover OpenBMC.<br /><br />I checked aspeed_wdt.c and
> > > manually played with watchdog registers, but<br />everything looks
> > > normal to me. Did anyone hit the similar error before?<br />Any
> > > suggestions which area I should look into?<br /><br />Below are the
> > > last few lines of logs before OpenBMC hangs:<br /><br />bmc-oob
> > > login:<br />INIT: Sending processes configured via /etc/inittab the
> > > TERM signal<br />Stopping OpenBSD Secure Shell server: sshdstopped
> > > /usr/sbin/sshd (pid 7397 1189)<br />Stopping ntpd: done<br />stopping
> > > rsyslogd ... done<br />Stopping random number generator daemon.<br
> > > />Deconfiguring network interfaces... done.<br />Sending all processes
> > > the TERM signal...<br />rackmond[1747]: Got request exit[ 528.383133]
> > > watchdog: watchdog0: watchdog did not stop!<br />Sending all processes
> > > the KILL signal...<br />Unmounting remote filesystems...<br
> > > />Deactivating swap...<br />Unmounting local filesystems...<br
> > > />Rebooting... [ 529.725009] reboot: Restarting system<br /><br /><br
> > > />Cheers,<br /><br />Tao</p></blockquote><div> </div><div>
> > > </div><div>-- </div><div>Best regards,</div><div>Konstantin
> > > Klubnichkin,</div><div>lead firmware engineer,</div><div>server
> > > hardware R&amp;D group,</div><div>Yandex Moscow office.</div><div>tel:
> > > +7-903-510-33-33</div><div> </div>
