Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B7FDBC8
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 11:54:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DwGQ3StVzF7Bl
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 21:54:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="uJHLOmTO"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (unknown [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DwFZ33CgzF7BC
 for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2019 21:53:54 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2FAFF43E0E;
 Fri, 15 Nov 2019 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1573815222; x=
 1575629623; bh=EmKbhECGLLC224w8jddWC4dgzS7FEzj2neP4bIS0BG0=; b=u
 JHLOmTOHrQ39Cxws15ZH9ZyW6i+AyrB9iK3Ey0ryYgnXV/ARi+GCHET3JL+m/JbF
 qYr/06ShzIGrhWgSCxerPjbdK7/8q4p77rn5rbK9HfMyNWVlatUCG0g9MzOGzUoF
 4eFKEFarRPxbQV9DHXtJrzQGqOxxH9+HPdgjJ75flI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jdBh0AweQWzi; Fri, 15 Nov 2019 13:53:42 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9669243E10;
 Fri, 15 Nov 2019 13:53:42 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 15
 Nov 2019 13:53:41 +0300
Subject: s2600wf problems (was: openbmc power-control can't work OK)
To: <openbmc@lists.ozlabs.org>, <jason.m.bills@linux.intel.com>
References: <78e5fc47.6f45.16e0259a229.Coremail.guilin1985@126.com>
 <3170cec0-1da7-d201-d8a5-92058682bb68@linux.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 mQINBFj0jdkBEADhQF4vZuu9vFfzxchRQtU/ys62Z13HTaYK/VCQKzPnm2mf593Il61FP9WV
 0Srt4t4yumiXK7NhHeqktN/YZjYDYVr9l+vZpNydOHpDjk7xjPgb0KkoFCo7bcQ2/e4AtLTQ
 XGoWIKv983vWlphPCG1Jof5jH3RA7mccCNXtGlzVYF0RYR0/qKGgsoBymkldNKPwgPf/3SXb
 QY5V3sJ5SHwDjmhg3MYnblV29OULdi72DKI9MkhTTHQFlA++CfYstx/cZ1BZwWmoMgi0umpj
 Pf+5mAkmTtlPW7U54EUgFpvTMfxRRS7yH+iTlvngduYW6jryt0zm6r7M2LGR+uWGSTmWBB7Y
 t06D0Xrm0Zwl4alQ5WDrlUTkzZcXDb0QqY7UkQSkghLmUjItEj4Z+ay7ynIsfjQe0OYdTofh
 dY0IUxMxNm9jeckOkRpSdgsQrTcKIOAt/8jI62jlzN1EXA6blhASv5xtt7I1WXCpDU+mpfKf
 ccUVJfmd0Q2nlG64L4Bv8o+iBI0Xu5+EX2NzDKQF5vSQIK8mwniAPT16hi80mZG9EQf0fJ1C
 p7xJGvwA6IiwXWsAqhNRhYbmNDfiR2MMxw5DFdQSeqoK3ONeeIwrJAPNdme+Z1DoT2+ZuZP0
 nfUa8e2QaMHkXwCz9e0cI2NUmAwFJ9Qg4L0eyhdZP4rQ1KCg/QARAQABtC9BbGV4YW5kZXIg
 QW1lbGtpbiAoWUFEUk8pIDxhLmFtZWxraW5AeWFkcm8uY29tPokCPQQTAQgAJwIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgAUCWmWolQUJcjFDNwAKCRDok1h7W3QXjTbXD/kBcitVfbx2
 7U00CSBwO3XmlNhgcVN7a83NQZ5W16oUQ0VPsFrL8qxRrpiqnIr+D+AUhtkI5aJRKX9ln69q
 TTSdodYnFbKCS+2mTHvtYnBUOl4Fm+deUm98fAyIyHkqPu+UPyOE8/M2zWwLuwZ6xMt6mTNb
 cQbauY2dbBUERuTnYh4SP42ZiMgwsf7sPEm2W+yLmxf+s9aZStwLXS/1e8oBIoS5Io403OQS
 U0W2RUPp/h0b6M9H5RFvaXuzAnmA274aC6qdWlrAB//m65Lo06puZqc8//SuQlDyEx4/bn/P
 NYDAYzQV/KoTrzBluGZUSMEOU5oSkLamQ4xcZY9ngALvo7Q8gTjrdKczO7nulS+rfXiPBP79
 5+O/LioJdbybbZ0yDUJzIzqapjBsfLink1TqAKY8VPc0QflWnaqRHb8uo6ykfelswCLpy1IB
 mSRb+Y4ERxIUbkg+mPyjr4tt0ja5vGqECAGsBwWlJ+ONt7gUIYJdLy54eWwYu/ul9XtwJypZ
 auOMjvqn09RF4HBcghL92VdBW9VV6GMy/ma+TZgcy5CSd/UN9rQx11iT1gwAhLnkni45bOIr
 0lpmnz8uNeIHL4OdK+dMcypLvPF95bKazw+iiAAHSv9MZmu3S4ECgHoU3u1moicVqyBmujXy
 GFLL1P+3HjeZ494/DpGNOnF1mbkCDQRY9I3ZARAAygmVNgjvxkqud75kP5fwhmwMVu13sLh8
 QnZxjMsA9Zelt1Hu+BVmjET7YL4xBhdJDZ4y3UI/MV8ZzOfJHUWSNr6POwKIrsQfGzdlgB0e
 w2k6Rm651Jp+aAsygB4GR7BopptJd9d/q5oCnZxpPgDpZOBCpl4DQ3fJIGSc8iQVmA84lHLS
 +mqIJ94PZ7uza4F0ly6Au+Hbkhowh/1q+BUd6Rn553WAmPAG7g0lAG/Obq1m77ovlR86yY5i
 C503QKlPJELSNYtzczuLQZetjDtaFkugke4QMlhzHyc7DjSsjyccdhepPtXWEm84jPCx1/KU
 3m9jAWtPdARQ73su/fiitmXAifQXJBB2R9fmKuM2F3ClHcJxv/l0W1ruekD9vojOO75yvBEG
 7fGlLc9hUgIIGgBJvI+Yb1/KhqWC9r53TS6kcuCi+z9kf+4MTBge2sU97DtivZGzul6yhrcr
 3Ic5paWoaka2ClGqKBQo3A9o4F60q3rRq5FAcMdKQq7qJutCzcjkcCpVVik1im0u0+UGrK0s
 YQuAgTu45mJPOfINqz1xz+qwxSjYI/wjxJaYTZLO68CIdBiDj+zxIeo9o/mUJvS+DhnPzKhW
 KXToZl2D7VdjOlu8zZ0tIFYrULJYhuw2f/KwD1lwoehlKikEE0H0xkPygufjtiYo6jTb+BKa
 sG8AEQEAAYkCJQQYAQgADwIbDAUCWmWo6AUJcjFDNwAKCRDok1h7W3QXjc9vEADXse2POSaT
 M0uqR3KGTeF8XVKdyRqK9afWbMaxFzOWGp9pNtcmIvfmyE0M6LPLgUb33jek/Ngup/RN7CjZ
 NCjOc2HTID99uBkYyLEcOYb+bycAReswjrv3a49ZBmmGKJZ+aAm0t6Zo6ekTdUtvlIrVYvRs
 UWWj4HdCaD+BMvSqcDZgyQESLI9nfEGuWtVqdi2QlZZeQT7W+RH4lihHKTdzOsVC93o4h6og
 ZvgOJ/0g1SP3la88RWONejHxVbGzBOyNjkH71CFujnAfuVuuhkJaN8PY/CS56sKMREKJOy0L
 vouE7eSU4bp13GK1xsnbWcDQpyzTsCsP9taqQmeld8Hw1yuPamc6fdpKNyPHyN20vzh20f0C
 QUMAjh3Vym12aKhyRan08VNEaLOKiyya6+i9c3Z3LiWUEqTSzELCkesb68UQVtE6/CXPM2P/
 vs3EQuLFXBC/rD9lurT0kG99xElAbKjHLer5NSw2WA2vQXaFadGNDyHI32Yt2cAqWzZtVqmN
 ESE0npJ5eeAcVWPHjhCwL8phZCDtfxJMy2cqYS8QLIBGfQTIHMQAgqBbpq9FLXCn008tvaTr
 KijxDkPtWeXDLbMgH1kA46gTPJWxsm0c45w7c3aXhXl4hOgXp+iWDTOT83tJU0zoD9hYlpZf
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <5985aeec-b76a-3326-146d-e3fa6c119c47@yadro.com>
Date: Fri, 15 Nov 2019 13:53:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3170cec0-1da7-d201-d8a5-92058682bb68@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aYI1egLQAqBl8rdnFoJ1V6ciD2M1hzcYZ"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

--aYI1egLQAqBl8rdnFoJ1V6ciD2M1hzcYZ
Content-Type: multipart/mixed; boundary="hSAL7GWGFbeZFnHRqlqYGGhW89ezrPfCL";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org, jason.m.bills@linux.intel.com
Message-ID: <5985aeec-b76a-3326-146d-e3fa6c119c47@yadro.com>
Subject: s2600wf problems (was: openbmc power-control can't work OK)
References: <78e5fc47.6f45.16e0259a229.Coremail.guilin1985@126.com>
 <3170cec0-1da7-d201-d8a5-92058682bb68@linux.intel.com>
In-Reply-To: <3170cec0-1da7-d201-d8a5-92058682bb68@linux.intel.com>

--hSAL7GWGFbeZFnHRqlqYGGhW89ezrPfCL
Content-Type: multipart/mixed;
 boundary="------------03C4FB865A72F8A2EE67D30E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------03C4FB865A72F8A2EE67D30E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bill!

We're also having difficulties running a generic meta-s2600wf on Intel re=
ference
s2600wf "Woflpass" board.

We're using a newer openbmc commit (985dee9cb6bb29800a933e882913a44e6b9d4=
f420)
with a patch to phosphor-dbus-interfaces taken from commit
0bbcc8f0cc34236d6f8549c5f51410420dbc8f08 of that project.
The patch is applied in order to make openbmc build for s2600wf, without =
the
patch the build fails complaining about the missing NMISource interface.

When we boot the image on s2600wf, we get a LOT of errors. The main probl=
ems we
have are:

1. Host power can't be controlled

2. Ethernet driver crashes

Below are the logs. I've cut out all the non-error output here, except fo=
r the
log header.

-- Logs begin at Thu 1970-01-01 00:00:10 UTC, end at Thu 1970-01-01 01:02=
:06 UTC. --
Jan 01 00:00:10 vegman-s2600wf kernel: Booting Linux on physical CPU 0x0
Jan 01 00:00:10 vegman-s2600wf kernel: Linux version 5.3.10-7b61b9e
(oe-user@oe-host) (gcc version 9.2.0 (GCC)) #1 Thu Nov 14 14:13:03 UTC 20=
19
Jan 01 00:00:10 vegman-s2600wf kernel: CPU: ARMv6-compatible processor
[410fb767] revision 7 (ARMv7), cr=3D00c5387d
Jan 01 00:00:10 vegman-s2600wf kernel: CPU: PIPT / VIPT nonaliasing data =
cache,
VIPT nonaliasing instruction cache
Jan 01 00:00:10 vegman-s2600wf kernel: OF: fdt: Machine model: S2600WF BM=
C
Jan 01 00:00:10 vegman-s2600wf kernel: Memory policy: Data cache writebac=
k
Jan 01 00:00:10 vegman-s2600wf kernel: cma: Reserved 16 MiB at 0x9d800000=

Jan 01 00:00:10 vegman-s2600wf kernel: Built 1 zonelists, mobility groupi=
ng on.=C2=A0
Total pages: 125984
Jan 01 00:00:10 vegman-s2600wf kernel: Kernel command line:
console=3DttyS4,115200n8 root=3D/dev/ram rw
----- 8< ------
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed_gfx 1e6e6000.display: faile=
d to
initialize reserved mem: -19
----- 8< ------
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Error app=
lying
setting, reverse things back
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Using 50 =
MHz SPI
frequency
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: unrecogni=
zed
JEDEC id bytes: 0a 0a 0a 0a 0a 0a
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Aspeed SM=
C probe
failed -2
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc: probe of 1e630000.spi =
failed
with error -2
----- 8< ------
Jan 01 00:00:10 vegman-s2600wf kernel: overlayfs: upper fs does not suppo=
rt tmpfile.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to lookup module alias
'autofs4': Function not implemented
----- 8< ------
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to put bus name to hash=
map:
File exists
Jan 01 00:00:10 vegman-s2600wf systemd[1]:
xyz.openbmc_project.State.Host.service: Two services allocated for the sa=
me bus
name xyz.openbmc_project.State.Host, refusing operation.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment:
obmc-host-reset-running@.target+0 =E2=86=92 obmc-host-reset-running@0.tar=
get
Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment:
obmc-host-reset@.target+0 =E2=86=92 obmc-host-reset@0.target
Jan 01 00:00:10 vegman-s2600wf systemd[1]:
/lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name,
ignoring: sys-subsystem-net-devices-%i.device
Jan 01 00:00:10 vegman-s2600wf systemd[1]:
xyz.openbmc_project.State.Host.service: Cannot add dependency job, ignori=
ng:
Unit xyz.openbmc_project.State.Host.service failed to load properly: File=
 exists.
----- 8< ------
Jan 01 00:00:28 vegman-s2600wf power-control[172]: Failed to find the PS_=
PWROK line
Jan 01 00:00:28 vegman-s2600wf systemd[1]:
xyz.openbmc_project.Chassis.Control.Power.service: Main process exited,
code=3Dexited, status=3D255/EXCEPTION
Jan 01 00:00:28 vegman-s2600wf systemd[1]:
xyz.openbmc_project.Chassis.Control.Power.service: Failed with result 'ex=
it-code'.
Jan 01 00:00:29 vegman-s2600wf systemd[1]: Failed to start Intel Power Co=
ntrol.
----- 8< ------
Jan 01 00:01:12 vegman-s2600wf kernel: ------------[ cut here ]----------=
--
Jan 01 00:01:12 vegman-s2600wf kernel: WARNING: CPU: 0 PID: 331 at
net/sched/sch_generic.c:447 dev_watchdog+0x268/0x288
Jan 01 00:01:12 vegman-s2600wf kernel: NETDEV WATCHDOG: eth0 (ftgmac100):=

transmit queue 0 timed out
Jan 01 00:01:12 vegman-s2600wf kernel: CPU: 0 PID: 331 Comm: python Not t=
ainted
5.3.10-7b61b9e #1
Jan 01 00:01:12 vegman-s2600wf kernel: Hardware name: Generic DT based sy=
stem
Jan 01 00:01:12 vegman-s2600wf kernel: Backtrace:
Jan 01 00:01:12 vegman-s2600wf kernel: [<80107c84>] (dump_backtrace) from=

[<80107eb8>] (show_stack+0x20/0x24)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r7:80a12d20 r6:00000000 r5:9=
972378c
r4:00000009
Jan 01 00:01:12 vegman-s2600wf kernel: [<80107e98>] (show_stack) from
[<806a84b0>] (dump_stack+0x20/0x28)
Jan 01 00:01:12 vegman-s2600wf kernel: [<806a8490>] (dump_stack) from
[<80116900>] (__warn.part.0+0xb4/0xdc)
Jan 01 00:01:12 vegman-s2600wf kernel: [<8011684c>] (__warn.part.0) from
[<80116998>] (warn_slowpath_fmt+0x70/0x98)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r6:805ad4bc r5:000001bf r4:8=
0840b28
Jan 01 00:01:12 vegman-s2600wf kernel: [<80116928>] (warn_slowpath_fmt) f=
rom
[<805ad4bc>] (dev_watchdog+0x268/0x288)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r3:99094000 r2:80840aec
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r6:00000000 r5:99071900 r4:9=
909422c
Jan 01 00:01:12 vegman-s2600wf kernel: [<805ad254>] (dev_watchdog) from
[<8015ad94>] (call_timer_fn+0x40/0x124)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:00000122 r8:ffffa6f8 r7:0=
0000100
r6:805ad254 r5:9909422c r4:9909422c
Jan 01 00:01:12 vegman-s2600wf kernel: [<8015ad54>] (call_timer_fn) from
[<8015af18>] (expire_timers+0xa0/0xdc)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r8:ffffa6f8 r7:80a13a40 r6:9=
9723854
r5:99723854 r4:9909422c
Jan 01 00:01:12 vegman-s2600wf kernel: [<8015ae78>] (expire_timers) from
[<8015aff4>] (run_timer_softirq+0xa0/0x198)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000002 r9:00000100 r8:=
80a12d20
r7:80a13a40 r6:80a13a40 r5:99723854
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:99723854 r3:ffffa6f9
Jan 01 00:01:12 vegman-s2600wf kernel: [<8015af54>] (run_timer_softirq) f=
rom
[<801022b4>] (__do_softirq+0xdc/0x314)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r8:00000000 r7:99722000 r6:8=
0a62334
r5:00000002 r4:00000001
Jan 01 00:01:12 vegman-s2600wf kernel: [<801021d8>] (__do_softirq) from
[<8011a93c>] (irq_exit+0xac/0xe4)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:98e186dc r9:99722000 r8:=
00000000
r7:9d413600 r6:00000001 r5:80a4a5d8
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000000
Jan 01 00:01:12 vegman-s2600wf kernel: [<8011a890>] (irq_exit) from [<801=
4d1f4>]
(__handle_domain_irq+0x60/0xb4)
Jan 01 00:01:12 vegman-s2600wf kernel: [<8014d194>] (__handle_domain_irq)=
 from
[<801021cc>] (avic_handle_irq+0x68/0x70)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:99722000 r8:98e18206 r7:9=
972396c
r6:ffffffff r5:99723938 r4:9d402e40
Jan 01 00:01:12 vegman-s2600wf kernel: [<80102164>] (avic_handle_irq) fro=
m
[<80101a6c>] (__irq_svc+0x6c/0x90)
Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723938 to 0x99=
723980)
Jan 01 00:01:12 vegman-s2600wf kernel:
3920:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000460 0000054b
Jan 01 00:01:12 vegman-s2600wf kernel: 3940: 00000008 000002df 98e18000 d=
e785a57
00000008 98e1800e 98e18206 000001cb
Jan 01 00:01:12 vegman-s2600wf kernel: 3960: 98e186dc 997239b4 0a4e3ec5 9=
9723988
00000458 803b58e0 20000013 ffffffff
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r5:20000013 r4:803b58e0
Jan 01 00:01:12 vegman-s2600wf kernel: [<803b559c>] (lzma_main) from
[<803b64ec>] (xz_dec_lzma2_run+0x678/0x824)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:00000000 r8:=
98e1e000
r7:98e1eee8 r6:0000002a r5:98e09a84
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:98e18000 r3:000003fd
Jan 01 00:01:12 vegman-s2600wf kernel: [<803b5e74>] (xz_dec_lzma2_run) fr=
om
[<803b4ad4>] (xz_dec_run+0x2d8/0xa78)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:994b0c00 r9:00000000 r8:=
98e09a84
r7:9d608800 r6:00000001 r5:00000001
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:98e09a80
Jan 01 00:01:12 vegman-s2600wf kernel: [<803b47fc>] (xz_dec_run) from
[<802c6618>] (squashfs_xz_uncompress+0x8c/0x234)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:994b0c00 r9:98e09a84 r8:=
98e09560
r7:0000001b r6:0000000d r5:00000001
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:98e09a80
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c658c>] (squashfs_xz_uncompre=
ss)
from [<802c6538>] (squashfs_decompress+0x68/0xa0)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:98e09560 r9:98e09440 r8:=
98e09444
r7:0000001b r6:994b0c00 r5:802c658c
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:990f4200
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c64d0>] (squashfs_decompress)=
 from
[<802c20ac>] (squashfs_read_data+0x404/0x734)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:994b0c68 r8:=
98e09560
r7:994b0bfc r6:0000001b r5:0000026c
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:0000001b
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c1ca8>] (squashfs_read_data) =
from
[<802c27b8>] (squashfs_cache_get+0x238/0x388)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000002 r9:9d602fc0 r8:=
990ba7b8
r7:00000000 r6:0131366c r5:990ba780
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000001
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c2580>] (squashfs_cache_get) =
from
[<802c2d88>] (squashfs_get_fragment+0x2c/0x34)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:9ee5c5e0 r9:00000004 r8:=
99723cd4
r7:ffffffff r6:9a05be18 r5:9a05be18
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000000
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c2d5c>] (squashfs_get_fragmen=
t) from
[<802c3b2c>] (squashfs_readpage+0xf4/0x920)
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c3a38>] (squashfs_readpage) f=
rom
[<802000b8>] (read_pages+0x10c/0x160)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00112cca r9:00000004 r8:=
99723cd4
r7:9a05bf00 r6:00000000 r5:9ee5c5e0
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:9ee5c5e4
Jan 01 00:01:12 vegman-s2600wf kernel: [<801fffac>] (read_pages) from
[<80200494>] (__do_page_cache_readahead+0x1b8/0x1d8)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:9a05bf04 r9:00112cca r8:=
99723cd4
r7:00000003 r6:00000004 r5:00000004
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000003
Jan 01 00:01:12 vegman-s2600wf kernel: [<802002dc>] (__do_page_cache_read=
ahead)
from [<802006cc>] (ondemand_readahead+0x218/0x288)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:99f785a0 r8:=
00000000
r7:9a05bf00 r6:00000000 r5:00000003
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:99f785f8
Jan 01 00:01:12 vegman-s2600wf kernel: [<802004b4>] (ondemand_readahead) =
from
[<802008b0>] (page_cache_sync_readahead+0x5c/0x7c)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:99723ec0 r9:99723dd8 r8:=
00000000
r7:00000000 r6:00000000 r5:99f785a0
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:9a05bf00
Jan 01 00:01:12 vegman-s2600wf kernel: [<80200854>] (page_cache_sync_read=
ahead)
from [<801f8138>] (generic_file_read_iter+0x680/0x970)
Jan 01 00:01:12 vegman-s2600wf kernel: [<801f7ab8>] (generic_file_read_it=
er)
from [<80242ef4>] (do_iter_readv_writev+0x150/0x1dc)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:99723ec0 r8:=
00000000
r7:99723ee0 r6:00000000 r5:00000000
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:99f785a0
Jan 01 00:01:12 vegman-s2600wf kernel: [<80242da4>] (do_iter_readv_writev=
) from
[<80243940>] (do_iter_read+0xf4/0x1ac)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:00000000 r8:=
00000001
r7:99723ee0 r6:99723ec0 r5:99f785a0
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000000
Jan 01 00:01:12 vegman-s2600wf kernel: [<8024384c>] (do_iter_read) from
[<80244d1c>] (vfs_iter_read+0x28/0x34)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:00000000 r8:=
00000400
r7:99495b40 r6:99723ec0 r5:99723ed8
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:9974d700
Jan 01 00:01:12 vegman-s2600wf kernel: [<80244cf4>] (vfs_iter_read) from
[<8031e23c>] (ovl_read_iter+0xc0/0x114)
Jan 01 00:01:12 vegman-s2600wf kernel: [<8031e17c>] (ovl_read_iter) from
[<802442f4>] (__vfs_read+0x150/0x1d4)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r7:00000000 r6:00000000 r5:9=
9723f60
r4:99495b40
Jan 01 00:01:12 vegman-s2600wf kernel: [<802441a4>] (__vfs_read) from
[<80244418>] (vfs_read+0xa0/0x120)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:00000000 r8:00000001 r7:9=
9723f60
r6:0175bec0 r5:99495b40 r4:00000400
Jan 01 00:01:12 vegman-s2600wf kernel: [<80244378>] (vfs_read) from [<802=
44838>]
(ksys_read+0x70/0xf8)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:00000000 r8:00000000 r7:0=
0000400
r6:0175bec0 r5:99495b40 r4:99495b40
Jan 01 00:01:12 vegman-s2600wf kernel: [<802447c8>] (ksys_read) from
[<802448d8>] (sys_read+0x18/0x1c)
Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:99722000 r8:801011e4 r7:0=
0000003
r6:76fe64d0 r5:430015bc r4:01695198
Jan 01 00:01:12 vegman-s2600wf kernel: [<802448c0>] (sys_read) from [<801=
01000>]
(ret_fast_syscall+0x0/0x54)
Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723fa8 to 0x99=
723ff0)
Jan 01 00:01:12 vegman-s2600wf kernel: 3fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 01695198 430015bc
00000004 0175bec0 00000400 00000000
Jan 01 00:01:12 vegman-s2600wf kernel: 3fc0: 01695198 430015bc 76fe64d0 0=
0000003
000005e8 432d4000 00001001 5dc2157e
Jan 01 00:01:12 vegman-s2600wf kernel: 3fe0: fbad2488 7ee24820 42f2d824 4=
2f85f7c
Jan 01 00:01:12 vegman-s2600wf kernel: ---[ end trace 0910e44f554793b0 ]-=
--
----- 8< ------

There are more errors as well. Please see the attached full log.

What do you suggest? How can we make it control the power of s2600wf host=
 and
how do we make the network interface work?

Thank you.

With best regards,
Alexander Amelkin,
YADRO [https://yadro.com]

25.10.2019 18:59, Bills, Jason M wrote:
> I'm copying the mailing list in case there are others who have similar =
questions.
>
> On 10/25/2019 2:57 AM, =E9=98=BF=E6=A1=82 wrote:
>> =C2=A0=C2=A0 =C2=A0Hi, jason
>> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Could you help me, please ? My=
 board is not a evb board, but it is
>> x86 platform. So i=C2=A0build openbmc *meta-s2600wf*(commit
>> ID=C2=A0c549f3a7f5496ec3b54ed65c8b4d8351db10995e) instead=EF=BC=8Cwhic=
h use
>> x86-power-control version f61ca6fdcc52beba485e014b5fad38a9e9a555ad
>> <https://github.com/openbmc/x86-power-control/commit/f61ca6fdcc52beba4=
85e014b5fad38a9e9a555ad>.
>> But when i use "ipmitools chassis power status" commond to get host st=
atus at
>> my board, it point out "Get Chassis Power Status failed: Unspecified e=
rror",
>> journalctl -f command refer to "ipmid[279]: Failed to fetch ACBoot pro=
perty,
>> ipmid[279]: Failed to fetch RestartCause property". It seems there hav=
e no
>> property in dbus.=C2=A0 Where is the dbus property=C2=A0ACBoot and=C2=A0=
RestartCause
>> defined?I'm puzzled about this /situation. Could you///give me some su=
ggestions?
>
> This is because the IPMI chassis power status command gets the power st=
atus by
> calling the IPMI chassis status command which requires a lot of other
> information such as the restart cause and AC fail status to return succ=
essfully.
>
> The ACBoot property is provided by a small script that we run to get th=
e reset
> reason from uboot.=C2=A0 You can find it here:
> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-=
common/recipes-core/ac-boot-check.
>
> The RestartCause property recently moved to x86-power-control and is be=
ing
> synced up in this review:
> https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-control/+/26491.=

>
> Thanks,
> -Jason
>
>> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks a lot./
>>
>>

--------------03C4FB865A72F8A2EE67D30E
Content-Type: text/x-log;
 name="s2600wf-bmc.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="s2600wf-bmc.log"

-- Logs begin at Thu 1970-01-01 00:00:10 UTC, end at Thu 1970-01-01 01:02=
:06 UTC. --
Jan 01 00:00:10 vegman-s2600wf kernel: Booting Linux on physical CPU 0x0
Jan 01 00:00:10 vegman-s2600wf kernel: Linux version 5.3.10-7b61b9e (oe-u=
ser@oe-host) (gcc version 9.2.0 (GCC)) #1 Thu Nov 14 14:13:03 UTC 2019
Jan 01 00:00:10 vegman-s2600wf kernel: CPU: ARMv6-compatible processor [4=
10fb767] revision 7 (ARMv7), cr=3D00c5387d
Jan 01 00:00:10 vegman-s2600wf kernel: CPU: PIPT / VIPT nonaliasing data =
cache, VIPT nonaliasing instruction cache
Jan 01 00:00:10 vegman-s2600wf kernel: OF: fdt: Machine model: S2600WF BM=
C
Jan 01 00:00:10 vegman-s2600wf kernel: Memory policy: Data cache writebac=
k
Jan 01 00:00:10 vegman-s2600wf kernel: cma: Reserved 16 MiB at 0x9d800000=

Jan 01 00:00:10 vegman-s2600wf kernel: Built 1 zonelists, mobility groupi=
ng on.  Total pages: 125984
Jan 01 00:00:10 vegman-s2600wf kernel: Kernel command line: console=3Dtty=
S4,115200n8 root=3D/dev/ram rw
Jan 01 00:00:10 vegman-s2600wf kernel: Dentry cache hash table entries: 6=
5536 (order: 6, 262144 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: Inode-cache hash table entries: 32=
768 (order: 5, 131072 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: mem auto-init: stack:off, heap all=
oc:off, heap free:off
Jan 01 00:00:10 vegman-s2600wf kernel: Memory: 476100K/507904K available =
(6144K kernel code, 391K rwdata, 1416K rodata, 1024K init, 145K bss, 1542=
0K reserved, 16384K cma-reserved)
Jan 01 00:00:10 vegman-s2600wf kernel: random: get_random_u32 called from=
 cache_alloc_refill+0x3e8/0x8d8 with crng_init=3D0
Jan 01 00:00:10 vegman-s2600wf kernel: ftrace: allocating 20952 entries i=
n 41 pages
Jan 01 00:00:10 vegman-s2600wf kernel: NR_IRQS: 16, nr_irqs: 16, prealloc=
ated irqs: 16
Jan 01 00:00:10 vegman-s2600wf kernel: i2c controller registered, irq 16
Jan 01 00:00:10 vegman-s2600wf kernel: clocksource: FTTMR010-TIMER2: mask=
: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 77222644334 ns
Jan 01 00:00:10 vegman-s2600wf kernel: sched_clock: 32 bits at 24MHz, res=
olution 40ns, wraps every 86767015915ns
Jan 01 00:00:10 vegman-s2600wf kernel: Switching to timer-based delay loo=
p, resolution 40ns
Jan 01 00:00:10 vegman-s2600wf kernel: Calibrating delay loop (skipped), =
value calculated using timer frequency.. 49.50 BogoMIPS (lpj=3D247500)
Jan 01 00:00:10 vegman-s2600wf kernel: pid_max: default: 32768 minimum: 3=
01
Jan 01 00:00:10 vegman-s2600wf kernel: Mount-cache hash table entries: 10=
24 (order: 0, 4096 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: Mountpoint-cache hash table entrie=
s: 1024 (order: 0, 4096 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: CPU: Testing write buffer coherenc=
y: ok
Jan 01 00:00:10 vegman-s2600wf kernel: Setting up static identity map for=
 0x80100000 - 0x80100038
Jan 01 00:00:10 vegman-s2600wf kernel: devtmpfs: initialized
Jan 01 00:00:10 vegman-s2600wf kernel: clocksource: jiffies: mask: 0xffff=
ffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
Jan 01 00:00:10 vegman-s2600wf kernel: futex hash table entries: 256 (ord=
er: -1, 3072 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: pinctrl core: initialized pinctrl =
subsystem
Jan 01 00:00:10 vegman-s2600wf kernel: NET: Registered protocol family 16=

Jan 01 00:00:10 vegman-s2600wf kernel: DMA: preallocated 256 KiB pool for=
 atomic coherent allocations
Jan 01 00:00:10 vegman-s2600wf kernel: hw-breakpoint: found 6 breakpoint =
and 1 watchpoint registers.
Jan 01 00:00:10 vegman-s2600wf kernel: hw-breakpoint: maximum watchpoint =
size is 4 bytes.
Jan 01 00:00:10 vegman-s2600wf kernel: videodev: Linux video capture inte=
rface: v2.00
Jan 01 00:00:10 vegman-s2600wf kernel: clocksource: Switched to clocksour=
ce FTTMR010-TIMER2
Jan 01 00:00:10 vegman-s2600wf kernel: NET: Registered protocol family 2
Jan 01 00:00:10 vegman-s2600wf kernel: tcp_listen_portaddr_hash hash tabl=
e entries: 512 (order: 0, 4096 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: TCP established hash table entries=
: 4096 (order: 2, 16384 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: TCP bind hash table entries: 4096 =
(order: 2, 16384 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: TCP: Hash tables configured (estab=
lished 4096 bind 4096)
Jan 01 00:00:10 vegman-s2600wf kernel: UDP hash table entries: 256 (order=
: 0, 4096 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: UDP-Lite hash table entries: 256 (=
order: 0, 4096 bytes, linear)
Jan 01 00:00:10 vegman-s2600wf kernel: NET: Registered protocol family 1
Jan 01 00:00:10 vegman-s2600wf kernel: Unpacking initramfs...
Jan 01 00:00:10 vegman-s2600wf kernel: Freeing initrd memory: 1088K
Jan 01 00:00:10 vegman-s2600wf kernel: workingset: timestamp_bits=3D30 ma=
x_order=3D17 bucket_order=3D0
Jan 01 00:00:10 vegman-s2600wf kernel: squashfs: version 4.0 (2009/01/31)=
 Phillip Lougher
Jan 01 00:00:10 vegman-s2600wf kernel: jffs2: version 2.2. (SUMMARY)  =C2=
=A9 2001-2006 Red Hat, Inc.
Jan 01 00:00:10 vegman-s2600wf kernel: NET: Registered protocol family 38=

Jan 01 00:00:10 vegman-s2600wf kernel: Serial: 8250/16550 driver, 6 ports=
, IRQ sharing enabled
Jan 01 00:00:10 vegman-s2600wf kernel: printk: console [ttyS4] disabled
Jan 01 00:00:10 vegman-s2600wf kernel: 1e784000.serial: ttyS4 at MMIO 0x1=
e784000 (irq =3D 30, base_baud =3D 1500000) is a 16550A
Jan 01 00:00:10 vegman-s2600wf kernel: printk: console [ttyS4] enabled
Jan 01 00:00:10 vegman-s2600wf kernel: timeriomem_rng 1e6e2078.hwrng: 32b=
its from 0x(ptrval) @ 1us
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed_gfx 1e6e6000.display: faile=
d to initialize reserved mem: -19
Jan 01 00:00:10 vegman-s2600wf kernel: random: fast init done
Jan 01 00:00:10 vegman-s2600wf kernel: random: crng init done
Jan 01 00:00:10 vegman-s2600wf kernel: loop: module loaded
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e620000.spi: Using 50 =
MHz SPI frequency
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e620000.spi: n25q512ax=
3 (65536 Kbytes)
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e620000.spi: CE0 windo=
w [ 0x20000000 - 0x24000000 ] 64MB
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e620000.spi: CE1 windo=
w [ 0x24000000 - 0x2a000000 ] 96MB
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e620000.spi: read cont=
rol register: 203c0641
Jan 01 00:00:10 vegman-s2600wf kernel: 5 fixed-partitions partitions foun=
d on MTD device bmc
Jan 01 00:00:10 vegman-s2600wf kernel: Creating 5 MTD partitions on "bmc"=
:
Jan 01 00:00:10 vegman-s2600wf kernel: 0x000000000000-0x000000060000 : "u=
-boot"
Jan 01 00:00:10 vegman-s2600wf kernel: 0x000000060000-0x000000080000 : "u=
-boot-env"
Jan 01 00:00:10 vegman-s2600wf kernel: 0x000000080000-0x0000004c0000 : "k=
ernel"
Jan 01 00:00:10 vegman-s2600wf kernel: 0x0000004c0000-0x000001c00000 : "r=
ofs"
Jan 01 00:00:10 vegman-s2600wf kernel: 0x000001c00000-0x000002000000 : "r=
wfs"
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Error app=
lying setting, reverse things back
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Using 50 =
MHz SPI frequency
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: unrecogni=
zed JEDEC id bytes: 0a 0a 0a 0a 0a 0a
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Aspeed SM=
C probe failed -2
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc: probe of 1e630000.spi =
failed with error -2
Jan 01 00:00:10 vegman-s2600wf kernel: libphy: Fixed MDIO Bus: probed
Jan 01 00:00:10 vegman-s2600wf kernel: ftgmac100 1e660000.ethernet: Gener=
ated random MAC address f6:29:33:37:27:88
Jan 01 00:00:10 vegman-s2600wf kernel: ftgmac100 1e660000.ethernet: Using=
 NCSI interface
Jan 01 00:00:10 vegman-s2600wf kernel: ftgmac100 1e660000.ethernet eth0: =
irq 19, mapped at 49dac45e
Jan 01 00:00:10 vegman-s2600wf kernel: ftgmac100 1e680000.ethernet: Gener=
ated random MAC address 7a:b8:e0:cb:ff:79
Jan 01 00:00:10 vegman-s2600wf kernel: libphy: ftgmac100_mdio: probed
Jan 01 00:00:10 vegman-s2600wf kernel: RTL8211F Gigabit Ethernet 1e680000=
=2Eethernet--1:00: attached PHY driver [RTL8211F Gigabit Ethernet] (mii_b=
us:phy_addr=3D1e680000.ethernet--1:00, irq=3DPOLL)
Jan 01 00:00:10 vegman-s2600wf kernel: ftgmac100 1e680000.ethernet eth1: =
irq 20, mapped at 0082f288
Jan 01 00:00:10 vegman-s2600wf kernel: udc-core: couldn't find an availab=
le UDC - added [g_mass_storage] to list of pending drivers
Jan 01 00:00:10 vegman-s2600wf kernel: i2c /dev entries driver
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-i2c-bus 1e78a080.i2c-bus: i=
2c bus 1 registered, irq 31
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-i2c-bus 1e78a0c0.i2c-bus: i=
2c bus 2 registered, irq 32
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-i2c-bus 1e78a100.i2c-bus: i=
2c bus 3 registered, irq 33
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-i2c-bus 1e78a140.i2c-bus: i=
2c bus 4 registered, irq 34
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-i2c-bus 1e78a180.i2c-bus: i=
2c bus 5 registered, irq 35
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-i2c-bus 1e78a1c0.i2c-bus: i=
2c bus 6 registered, irq 36
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-i2c-bus 1e78a300.i2c-bus: i=
2c bus 7 registered, irq 37
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-i2c-bus 1e78a480.i2c-bus: i=
2c bus 13 registered, irq 38
Jan 01 00:00:10 vegman-s2600wf kernel: Driver for 1-wire Dallas network p=
rotocol.
Jan 01 00:00:10 vegman-s2600wf kernel: NET: Registered protocol family 10=

Jan 01 00:00:10 vegman-s2600wf kernel: Segment Routing with IPv6
Jan 01 00:00:10 vegman-s2600wf kernel: sit: IPv6, IPv4 and MPLS over IPv4=
 tunneling driver
Jan 01 00:00:10 vegman-s2600wf kernel: NET: Registered protocol family 17=

Jan 01 00:00:10 vegman-s2600wf kernel: 8021q: 802.1Q VLAN Support v1.8
Jan 01 00:00:10 vegman-s2600wf kernel: printk: console [netcon0] enabled
Jan 01 00:00:10 vegman-s2600wf kernel: netconsole: network logging starte=
d
Jan 01 00:00:10 vegman-s2600wf kernel: hctosys: unable to open rtc device=
 (rtc0)
Jan 01 00:00:10 vegman-s2600wf kernel: Freeing unused kernel memory: 1024=
K
Jan 01 00:00:10 vegman-s2600wf kernel: Checked W+X mappings: passed, no W=
+X pages found
Jan 01 00:00:10 vegman-s2600wf kernel: Run /init as init process
Jan 01 00:00:10 vegman-s2600wf kernel: jffs2: notice: (75) jffs2_build_xa=
ttr_subsystem: complete building xattr subsystem, 25 of xdatum (15 unchec=
ked, 1 orphan) and 53 of xref (1 dead, 0 orphan) found.
Jan 01 00:00:10 vegman-s2600wf kernel: overlayfs: upper fs does not suppo=
rt tmpfile.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to lookup module alias =
'autofs4': Function not implemented
Jan 01 00:00:10 vegman-s2600wf systemd[1]: systemd 243+ running in system=
 mode. (+PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK +SYSVINIT -UTMP -LIBCR=
YPTSETUP -GCRYPT -GNUTLS -ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -I=
DN2 -IDN -PCRE2 default-hierarchy=3Dhybrid)
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Detected architecture arm.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Set hostname to <vegman-s2600w=
f>.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to put bus name to hash=
map: File exists
Jan 01 00:00:10 vegman-s2600wf systemd[1]: xyz.openbmc_project.State.Host=
=2Eservice: Two services allocated for the same bus name xyz.openbmc_proj=
ect.State.Host, refusing operation.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment: obmc-=
host-reset-running@.target+0 =E2=86=92 obmc-host-reset-running@0.target
Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment: obmc-=
host-reset@.target+0 =E2=86=92 obmc-host-reset@0.target
Jan 01 00:00:10 vegman-s2600wf systemd[1]: /lib/systemd/system/phosphor-i=
pmi-net@.socket:3: Invalid interface name, ignoring: sys-subsystem-net-de=
vices-%i.device
Jan 01 00:00:10 vegman-s2600wf systemd[1]: xyz.openbmc_project.State.Host=
=2Eservice: Cannot add dependency job, ignoring: Unit xyz.openbmc_project=
=2EState.Host.service failed to load properly: File exists.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: system-getty.slice: unit confi=
gures an IP firewall, but the local system does not support BPF/cgroup fi=
rewalling.
Jan 01 00:00:10 vegman-s2600wf systemd-journald[97]: Journal started
Jan 01 00:00:10 vegman-s2600wf systemd-journald[97]: Runtime Journal (/ru=
n/log/journal/46d10cdfee6d47e3a589383c880bcde3) is 8.0M, max 64.0M, 56.0M=
 free.
Jan 01 00:00:10 vegman-s2600wf systemd-sysctl[100]: Couldn't write '16' t=
o 'kernel/sysrq', ignoring: No such file or directory
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Started Journal Service.
Jan 01 00:00:10 vegman-s2600wf systemd-sysctl[100]: Couldn't write 'fq_co=
del' to 'net/core/default_qdisc', ignoring: No such file or directory
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Starting Flush Journal to Pers=
istent Storage...
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Started Create Static Device N=
odes in /dev.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Reached target Local File Syst=
ems (Pre).
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Mounting /var/volatile...
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Starting udev Kernel Device Ma=
nager...
Jan 01 00:00:10 vegman-s2600wf systemd-journald[97]: Runtime Journal (/ru=
n/log/journal/46d10cdfee6d47e3a589383c880bcde3) is 8.0M, max 64.0M, 56.0M=
 free.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Started Flush Journal to Persi=
stent Storage.
Jan 01 00:00:11 vegman-s2600wf systemd[110]: systemd-udevd.service: Prote=
ctHostname=3Dyes is configured, but the kernel does not support UTS names=
paces, ignoring namespace setup.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Mounted /var/volatile.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Condition check resulted in Bi=
nd mount volatile /var/cache being skipped.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Condition check resulted in Bi=
nd mount volatile /var/lib being skipped.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Starting Load/Save Random Seed=
=2E..
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Condition check resulted in Bi=
nd mount volatile /var/spool being skipped.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Condition check resulted in Bi=
nd mount volatile /srv being skipped.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Reached target Local File Syst=
ems.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Condition check resulted in Co=
mmit a transient machine-id on disk being skipped.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Starting Create Volatile Files=
 and Directories...
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Started Load/Save Random Seed.=

Jan 01 00:00:11 vegman-s2600wf systemd[1]: Started Create Volatile Files =
and Directories.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Condition check resulted in Re=
build Journal Catalog being skipped.
Jan 01 00:00:11 vegman-s2600wf systemd[1]: Starting Network Time Synchron=
ization...
Jan 01 00:00:12 vegman-s2600wf systemd[1]: Condition check resulted in Up=
date is Completed being skipped.
Jan 01 00:00:12 vegman-s2600wf systemd-udevd[110]: Configuration file /li=
b/udev/rules.d/70-hwmon.rules is marked executable. Please remove executa=
ble permission bits. Proceeding anyway.
Jan 01 00:00:12 vegman-s2600wf systemd-udevd[110]: Configuration file /li=
b/udev/rules.d/70-iio.rules is marked executable. Please remove executabl=
e permission bits. Proceeding anyway.
Jan 01 00:00:12 vegman-s2600wf systemd-udevd[110]: Configuration file /li=
b/udev/rules.d/70-leds.rules is marked executable. Please remove executab=
le permission bits. Proceeding anyway.
Jan 01 00:00:12 vegman-s2600wf systemd[1]: Started udev Kernel Device Man=
ager.
Jan 01 00:00:12 vegman-s2600wf systemd[1]: Starting Network Service...
Jan 01 00:00:14 vegman-s2600wf systemd-udevd[126]: Using default interfac=
e naming scheme 'v243'.
Jan 01 00:00:14 vegman-s2600wf systemd-udevd[126]: ethtool: autonegotiati=
on is unset or enabled, the speed and duplex are not writable.
Jan 01 00:00:14 vegman-s2600wf systemd-udevd[116]: Using default interfac=
e naming scheme 'v243'.
Jan 01 00:00:14 vegman-s2600wf systemd-udevd[116]: ethtool: autonegotiati=
on is unset or enabled, the speed and duplex are not writable.
Jan 01 00:00:14 vegman-s2600wf systemd[114]: systemd-timesyncd.service: P=
rotectHostname=3Dyes is configured, but the kernel does not support UTS n=
amespaces, ignoring namespace setup.
Jan 01 00:00:14 vegman-s2600wf systemd[1]: Started udev Coldplug all Devi=
ces.
Jan 01 00:00:15 vegman-s2600wf systemd[1]: Started Network Time Synchroni=
zation.
Jan 01 00:00:16 vegman-s2600wf systemd-udevd[118]: ethtool: autonegotiati=
on is unset or enabled, the speed and duplex are not writable.
Jan 01 00:00:16 vegman-s2600wf systemd-udevd[126]: ethtool: autonegotiati=
on is unser enabled, the speed and duplex are not writable.
Jan 01 00:00:16 vegman-s2600wf systemd-timesyncd[114]: No network connect=
ivity, watching for changes.
Jan 01 00:00:16 vegman-s2600wf systemd-networkd[119]: Enumeration complet=
ed
Jan 01 00:00:16 vegman-s2600wf systemd-networkd[119]: eth1: IPv6 successf=
ully enabled
Jan 01 00:00:16 vegman-s2600wf systemd[1]: Started Network Service.
Jan 01 00:00:16 vegman-s2600wf systemd-networkd[119]: eth0: IPv6 successf=
ully enabled
Jan 01 00:00:16 vegman-s2600wf kernel: 8021q: adding VLAN 0 to HW filter =
on device eth0
Jan 01 00:00:16 vegman-s2600wf systemd-networkd[119]: eth0: Gained carrie=
r
Jan 01 00:00:16 vegman-s2600wf systemd-networkd[119]: sit0: Gained carrie=
r
Jan 01 00:00:16 vegman-s2600wf systemd[1]: Created slice system-xyz.openb=
mc_project.Hwmon.slice.
Jan 01 00:00:16 vegman-s2600wf systemd[1]: Reached target System Time Set=
=2E
Jan 01 00:00:16 vegman-s2600wf systemd[1]: Reached target System Time Syn=
chronized.
Jan 01 00:00:16 vegman-s2600wf systemd[1]: Condition check resulted in Hu=
ge Pages File System being skipped.
Jan 01 00:00:16 vegman-s2600wf systemd[1]: Condition check resulted in PO=
SIX Message Queue File System being skipped.
Jan 01 00:00:16 vegman-s2600wf systemd[1]: Condition check resulted in Cr=
eate list of static device nodes for the current kernel being skipped.
Jan 01 00:00:16 vegman-s2600wf systemd[1]: Condition check resulted in Re=
build Journal Catalog being skipped.
Jan 01 00:00:16 vegman-s2600wf systemd[1]: Condition check resulted in Co=
mmit a transient machine-id on disk being skipped.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Condition check resulted in Lo=
ad Kernel Modules being skipped.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Condition check resulted in FU=
SE Control File System being skipped.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Condition check resulted in Cr=
eate System Users being skipped.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Starting Network Name Resoluti=
on...
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Condition check resulted in Up=
date is Completed being skipped.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Reached target System Initiali=
zation.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: logrotate.timer: Not using per=
sistent file timestamp Thu 1970-01-01 00:00:19 UTC as it is in the future=
=2E
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Started Daily rotation of log =
files.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Started Daily Cleanup of Tempo=
rary Directories.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Reached target Timers.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Listening on Avahi mDNS/DNS-SD=
 Stack Activation Socket.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Listening on BMC Webserver soc=
ket.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Listening on D-Bus System Mess=
age Bus Socket.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Listening on dropbear.socket.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Listening on Phosphor Host Con=
sole SSH Per-Connection socket.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Listening on phosphor-ipmi-net=
@eth0.socket.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Reached target Sockets.
Jan 01 00:00:17 vegman-s2600wf systemd[1]: Starting D-Bus System Message =
Bus...
Jan 01 00:00:17 vegman-s2600wf systemd-resolved[137]: Positive Trust Anch=
ors:
Jan 01 00:00:17 vegman-s2600wf systemd-resolved[137]: . IN DS 19036 8 2 4=
9aac11d7b6f6446702e54a1607371607a1a41855200fd2ce1cdde32f24e8fb5
Jan 01 00:00:17 vegman-s2600wf systemd-resolved[137]: . IN DS 20326 8 2 e=
06d44b80b8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec8d
Jan 01 00:00:17 vegman-s2600wf systemd-resolved[137]: Negative trust anch=
ors: 10.in-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 18.172.in-ad=
dr.arpa 19.172.in-addr.arpa 20.172.in-addr.arpa 21.172.in-addr.arpa 22.17=
2.in-addr.arpa 23.172.in-addr.arpa 24.172.in-addr.arpa 25.172.in-addr.arp=
a 26.172.in-addr.arpa 27.172.in-addr.arpa 28.172.in-addr.arpa 29.172.in-a=
ddr.arpa 30.172.in-addr.arpa 31.172.in-addr.arpa 168.192.in-addr.arpa d.f=
=2Eip6.arpa corp home internal intranet lan local private test
Jan 01 00:00:18 vegman-s26wf systemd-resolved[137]: Using system hostname=
 'vegman-s2600wf'.
Jan 01 00:00:18 vegman-s2600wf systemd[1]: Started Network Name Resolutio=
n.
Jan 01 00:00:18 vegman-s2600wf systemd[1]: Reached target Network.
Jan 01 00:00:18 vegman-s2600wf systemd[1]: Reached target Host and Networ=
k Name Lookups.
Jan 01 00:00:18 vegman-s2600wf systemd-networkd[119]: eth0: Gained IPv6LL=

Jan 01 00:00:18 vegman-s2600wf systemd-timesyncd[114]: Network configurat=
ion changed, trying to establish connection.
Jan 01 00:00:18 vegman-s2600wf systemd[1]: Started D-Bus System Message B=
us.
Jan 01 00:00:19 vegman-s2600wf systemd[1]: Reached target Basic System.
Jan 01 00:00:19 vegman-s2600wf systemd[1]: Starting Avahi mDNS/DNS-SD Sta=
ck...
Jan 01 00:00:19 vegman-s2600wf dbus-broker-lau[139]: Ready
Jan 01 00:00:19 vegman-s2600wf systemd[1]: Started Start bmcweb server.
Jan 01 00:00:19 vegman-s2600wf systemd[1]: Starting Clear one time boot o=
verrides...
Jan 01 00:00:19 vegman-s2600wf systemd[1]: Starting SSH Key Generation...=

Jan 01 00:00:19 vegman-s2600wf systemd[1]: Starting Name Service Cache Da=
emon...
Jan 01 00:00:19 vegman-s2600wf systemd[1]: Starting LDAP daemon...
Jan 01 00:00:19 vegman-s2600wf systemd[1]: Started Phosphor Dump core mon=
itor..
Jan 01 00:00:20 vegman-s2600wf systemd[1]: Starting Phosphor BMC0 Control=
=2E..
Jan 01 00:00:20 vegman-s2600wf systemd[1]: Starting OpenPOWER Host0 Contr=
ol...
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring file `/etc/passw=
d` (1)
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring directory `/etc`=
 (2)
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring file `/etc/group=
` (3)
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring directory `/etc`=
 (2)
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring file `/etc/hosts=
` (4)
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring directory `/etc`=
 (2)
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring file `/etc/resol=
v.conf` (5)
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring directory `/etc`=
 (2)
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring file `/etc/servi=
ces` (6)
Jan 01 00:00:20 vegman-s2600wf nscd[151]: 151 monitoring directory `/etc`=
 (2)
Jan 01 00:00:20 vegman-s2600wf systemd[1]: Starting Phosphor Download Man=
ager...
Jan 01 00:00:20 vegman-s2600wf systemd[1]: Started Phosphor certificate m=
anager for authority.
Jan 01 00:00:20 vegman-s2600wf systemd[1]: Started Phosphor certificate m=
anager for bmcweb.
Jan 01 00:00:21 vegman-s2600wf nscd[151]: 151 cannot write to database fi=
le /var/db/nscd/passwd: Invalid argument
Jan 01 00:00:21 vegman-s2600wf systemd[1]: Started Phosphor certificate m=
anager for nslcd.
Jan 01 00:00:21 vegman-s2600wf nscd[151]: 151 cannot write to database fi=
le /var/db/nscd/group: Invalid argument
Jan 01 00:00:21 vegman-s2600wf systemd[1]: Started Phosphor-Pid-Control M=
argin-based Fan Control Daemon.
Jan 01 00:00:21 vegman-s2600wf systemd[1]: Started phosphor systemd targe=
t monitor.
Jan 01 00:00:21 vegman-s2600wf nscd[151]: 151 cannot write to database fi=
le /var/db/nscd/hosts: Invalid argument
Jan 01 00:00:21 vegman-s2600wf systemd[1]: Starting System Logging Servic=
e...
Jan 01 00:00:21 vegman-s2600wf nscd[151]: 151 cannot write to database fi=
le /var/db/nscd/services: Invalid argument
Jan 01 00:00:22 vegman-s2600wf systemd[1]: Started Lightweight SLP Server=
=2E
Jan 01 00:00:22 vegman-s2600wf systemd[1]: Starting OpenBMC ipKVM daemon.=
=2E.
Jan 01 00:00:22 vegman-s2600wf systemd[1]: Starting Permit User Sessions.=
=2E.
Jan 01 00:00:22 vegman-s2600wf systemd[1]: Starting Intel Power Control..=
=2E
Jan 01 00:00:ted in Getty on tty1 being skipped.
Jan 01 00:00:32 vegman-s2600wf systemd[1]: Starting Wait for /org/openbmc=
/managers/Download...
Jan 01 00:00:32 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/control/host0/boot/one_time...
Jan 01 00:00:32 vegman-s2600wf nslcd[206]: [8b4567] <group=3D"priv-noacce=
ss"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP =
server: Transport endpoint is not connected
Jan 01 00:00:32 vegman-s2600wf nslcd[206]: [8b4567] <group=3D"priv-noacce=
ss"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:32 vegman-s2600wf avahi-daemon[202]: Found user 'avahi' (UID=
 997) and group 'avahi' (GID 996).
Jan 01 00:00:32 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP s=
erver: Transport endpoint is not connected
Jan 01 00:00:32 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:32 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/control/host0/boot...
Jan 01 00:00:32 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/control/host0/power_restore_policy...
Jan 01 00:00:32 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/control/host0/restriction_mode...
Jan 01 00:00:33 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/led/groups/bmc_booted...
Jan 01 00:00:33 vegman-s2600wf kernel: ftgmac100 1e660000.ethernet eth0: =
NCSI: No channel found to configure!
Jan 01 00:00:33 vegman-s2600wf nslcd[206]: [8b4567] <group=3D"priv-noacce=
ss"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP =
server: Transport endpoint is not connected
Jan 01 00:00:33 vegman-s2600wf nslcd[206]: [8b4567] <group=3D"priv-noacce=
ss"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:33 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/led/groups...
Jan 01 00:00:33 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP s=
erver: Transport endpoint is not connected
Jan 01 00:00:33 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:33 vegman-s2600wf phosphor-certificate-manager[154]: Certifi=
cate loadCert
Jan 01 00:00:33 vegman-s2600wf phosphor-certificate-manager[154]: Error o=
ccured during X509_verify_cert call, checking for known error
Jan 01 00:00:33 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/state/chassis0...
Jan 01 00:00:33 vegman-s2600wf phosphor-certificate-manager[154]: Certifi=
cate compareKeys
Jan 01 00:00:33 vegman-s2600wf phosphor-certificate-manager[154]: Certifi=
cate loadCert
Jan 01 00:00:33 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/state/host0...
Jan 01 00:00:33 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/time/owner...
Jan 01 00:00:34 vegman-s2600wf systemd[1]: Starting Wait for /xyz/openbmc=
_project/time/sync_method...
Jan 01 00:00:34 vegman-s2600wf nslcd[206]: [3c9869] <group=3D"priv-noacce=
ss"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP =
server: Transport endpoint is not connected
Jan 01 00:00:34 vegman-s2600wf nslcd[206]: [3c9869] <group=3D"priv-noacce=
ss"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:34 vegman-s2600wf kernel: ftgmac100 1e660000.ethernet eth0: =
Wrong NCSI state 0x100 in workqueue
Jan 01 00:00:34 vegman-s2600wf systemd[1]: Started Phosphor DBus Monitor.=

Jan 01 00:00:34 vegman-s2600wf 00:00:37 vegman-s2600wf nslcd[206]: [8b456=
7] <group=3D"priv-noaccess"> no available LDAP server found, sleeping 1 s=
econds
Jan 01 00:00:37 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP s=
erver: Transport endpoint is not connected
Jan 01 00:00:37 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:37 vegman-s2600wf nslcd[206]: [334873] <group/member=3D"avah=
i"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP s=
erver: Transport endpoint is not connected
Jan 01 00:00:37 vegman-s2600wf nslcd[206]: [334873] <group/member=3D"avah=
i"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:37 vegman-s2600wf systemd[1]: Started IPMB Sensor.
Jan 01 00:00:38 vegman-s2600wf systemd[1]: Started MCU Temp Sensor.
Jan 01 00:00:38 vegman-s2600wf nslcd[206]: [3c9869] <group=3D"priv-noacce=
ss"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP =
server: Transport endpoint is not connected
Jan 01 00:00:38 vegman-s2600wf nslcd[206]: [3c9869] <group=3D"priv-noacce=
ss"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:38 vegman-s2600wf nslcd[206]: [8b4567] <group=3D"priv-noacce=
ss"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP =
server: Transport endpoint is not connected
Jan 01 00:00:38 vegman-s2600wf nslcd[206]: [8b4567] <group=3D"priv-noacce=
ss"> no available LDAP server found: Can't contact LDAP server: Transport=
 endpoint is not connected
Jan 01 00:00:38 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP s=
erver: Transport endpoint is not connected
Jan 01 00:00:38 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:38 vegman-s2600wf nslcd[206]: [334873] <group/member=3D"avah=
i"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP s=
erver: Transport endpoint is not connected
Jan 01 00:00:38 vegman-s2600wf nslcd[206]: [334873] <group/member=3D"avah=
i"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:38 vegman-s2600wf systemd[1]: Started PSU Sensor.
Jan 01 00:00:39 vegman-s2600wf nslcd[206]: [3c9869] <group=3D"priv-noacce=
ss"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP =
server: Transport endpoint is not connected
Jan 01 00:00:39 vegman-s2600wf nslcd[206]: [3c9869] <group=3D"priv-noacce=
ss"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:39 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP s=
erver: Transport endpoint is not connected
Jan 01 00:00:39 vegman-s2600wf nslcd[206]: [7b23c6] <group/member=3D"avah=
i"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:39 vegman-s2600wf nslcd[206]: [334873] <group/member=3D"avah=
i"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP s=
erver: Transport endpoint is not connected
Jan 01 00:00:39 vegman-s2600wf nslcd[206]: [334873] <group/member=3D"avah=
i"> no available LDAP server found, sleeping 1 seconds
Jan 01 00:00:40 vegman-s2600wf nslcd[206]: [3c9869] <group=3D"priv-noacce=
ss"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP =
server: Transport endpoint is not connected
Jan 01 00:00:40 vegman-s2600wf nslcd[206]: [3c9869] <group=3D"priv-noacce=
ss"> no available LDAP server found: Can't contact LDAP server: Transport=
 endpoint is not connected
Jan 01 00:00:40 vegman-s2600wf phosphor-use-daemon[202]: New relevant int=
erface eth0.IPv6 for mDNS.
Jan 01 00:00:41 vegman-s2600wf avahi-daemon[202]: Joining mDNS multicast =
group on interface eth0.IPv4 with address 169.254.168.46.
Jan 01 00:00:42 vegman-s2600wf avahi-daemon[202]: New relevant interface =
eth0.IPv4 for mDNS.
Jan 01 00:00:42 vegman-s2600wf avahi-daemon[202]: Network interface enume=
ration completed.
Jan 01 00:00:42 vegman-s2600wf avahi-daemon[202]: Registering new address=
 record for fe80::a44d:2ff:fe0d:4da8 on eth0.*.
Jan 01 00:00:42 vegman-s2600wf avahi-daemon[202]: Registering new address=
 record for 169.254.168.46 on eth0.IPv4.
Jan 01 00:00:42 vegman-s2600wf systemd[1]: Started Wait for /xyz/openbmc_=
project/control/host0/boot.
Jan 01 00:00:42 vegman-s2600wf systemd[1]: Started Wait for /xyz/openbmc_=
project/control/host0/power_restore_policy.
Jan 01 00:00:42 vegman-s2600wf systemd[1]: Started Wait for /xyz/openbmc_=
project/control/host0/restriction_mode.
Jan 01 00:00:42 vegman-s2600wf avahi-daemon[202]: Server startup complete=
=2E Host name is vegman-s2600wf.local. Local service cookie is 2376070938=
=2E
Jan 01 00:00:42 vegman-s2600wf systemd[1]: Started Wait for /xyz/openbmc_=
project/led/groups/bmc_booted.
Jan 01 00:00:43 vegman-s2600wf intrusion-sensor[247]: can't find matched =
I2C or GPIO configuration for intrusion sensor.
Jan 01 00:00:43 vegman-s2600wf systemd[1]: Started Wait for /xyz/openbmc_=
project/led/groups.
Jan 01 00:00:43 vegman-s2600wf systemd[1]: Started Wait for /xyz/openbmc_=
project/time/owner.
Jan 01 00:00:43 vegman-s2600wf systemd[1]: Started Wait for /xyz/openbmc_=
project/time/sync_method.
Jan 01 00:00:43 vegman-s2600wf avahi-daemon[202]: Service "vegman-s2600wf=
" (/services/ssh.service) successfully established.
Jan 01 00:00:43 vegman-s2600wf avahi-daemon[202]: Service "vegman-s2600wf=
" (/services/sftp-ssh.service) successfully established.
Jan 01 00:00:43 vegman-s2600wf avahi-daemon[202]: Service "obmc_console" =
(/services/obmc_console.service) successfully established.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Service RestartSec=3D3s expired, scheduling restart.=

Jan 01 00:00:44 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Scheduled restart job, restart counter is at 1.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: start-ipkvm.service: Service R=
estartSec=3D1s expired, scheduling restart.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: start-ipkvm.service: Scheduled=
 restart job, restart counter is at 1.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: Started Phosphor BMC0 Control.=

Jan 01 00:00:44 vegman-s2600wf systemd[1]: phosphor-pid-control.service: =
Service RestartSec=3D5s expired, scheduling restart.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: phosphor-pid-control.service: =
Scheduled restart job, restart counter is at 1.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: Started Phosphor SNMP conf Man=
ager.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: Started Phosphor Network Manag=
er.
Jan 01 00:00:44 vegman-s2600wf phosphor-chassis-state-manager[240]: Initi=
al Chassis State will be Off
Jan 01 00:00:44 vegman-s2600wf systemd[1]: Started OpenBMC Software Updat=
e Manager.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: Started Phosphor Ldap config u=
pdater.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: Started Avahi mDNS/DNS-SD Stac=
k.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: Started Wait for /xyz/openbmc_=
project/state/chassis0.
Jan 01 00:00:44 vegman-s2600wf systemd[1]: Started Phosphor User Manager.=

Jan 01 00:00:45 vegman-s2600wf entity-manager[203]: Inventory Added
Jan 01 00:00:45 vegman-s2600wf eanager.
Jan 01 00:00:45 vegman-s2600wf kernel: i2c i2c-13: new_device: Instantiat=
ed device eeprom at 0x56
Jan 01 00:00:45 vegman-s2600wf systemd[1]: Started FRU Fault monitor serv=
ice.
Jan 01 00:00:45 vegman-s2600wf kernel: lm75 13-004e: hwmon1: sensor 'tmp7=
5'
Jan 01 00:00:45 vegman-s2600wf kernel: i2c i2c-13: new_device: Instantiat=
ed device tmp75 at 0x4e
Jan 01 00:00:45 vegman-s2600wf kernel: i2c i2c-2: new_device: Instantiate=
d device eeprom at 0x51
Jan 01 00:00:45 vegman-s2600wf systemd[1]: Starting Phosphor Inband IPMI.=
=2E.
Jan 01 00:00:45 vegman-s2600wf systemd[1]: Stopped Phosphor-Pid-Control M=
argin-based Fan Control Daemon.
Jan 01 00:00:45 vegman-s2600wf kernel: i2c i2c-2: Added multiplexed i2c b=
us 14
Jan 01 00:00:45 vegman-s2600wf systemd[1]: Started Phosphor-Pid-Control M=
argin-based Fan Control Daemon.
Jan 01 00:00:45 vegman-s2600wf kernel: i2c i2c-2: Added multiplexed i2c b=
us 15
Jan 01 00:00:45 vegman-s2600wf kernel: i2c i2c-2: Added multiplexed i2c b=
us 16
Jan 01 00:00:45 vegman-s2600wf systemd[1]: Stopped OpenBMC ipKVM daemon.
Jan 01 00:00:45 vegman-s2600wf kernel: i2c i2c-2: Added multiplexed i2c b=
us 17
Jan 01 00:00:45 vegman-s2600wf kernel: pca954x 2-0073: registered 4 multi=
plexed busses for I2C mux pca9544
Jan 01 00:00:46 vegman-s2600wf kernel: i2c i2c-2: new_device: Instantiate=
d device pca9544 at 0x73
Jan 01 00:00:46 vegman-s2600wf avahi-daemon[202]: Withdrawing address rec=
ord for 169.254.168.46 on eth0.
Jan 01 00:00:46 vegman-s2600wf systemd[1]: Starting OpenBMC ipKVM daemon.=
=2E.
Jan 01 00:00:46 vegman-s2600wf avahi-daemon[202]: Leaving mDNS multicast =
group on interface eth0.IPv4 with address 169.254.168.46.
Jan 01 00:00:46 vegman-s2600wf systemd-timesyncd[114]: Network configurat=
ion changed, trying to establish connection.
Jan 01 00:00:46 vegman-s2600wf avahi-daemon[202]: Interface eth0.IPv4 no =
longer relevant for mDNS.
Jan 01 00:00:46 vegman-s2600wf systemd[1]: Stopping Network Service...
Jan 01 00:00:46 vegman-s2600wf nscd[151]: 151 ignored inotify event for `=
/etc/resolv.conf` (file exists)
Jan 01 00:00:46 vegman-s2600wf kernel: lm75 2-0049: hwmon2: sensor 'tmp75=
'
Jan 01 00:00:46 vegman-s2600wf kernel: i2c i2c-2: new_device: Instantiate=
d device tmp75 at 0x49
Jan 01 00:00:46 vegman-s2600wf systemd[1]: Stopped Intel Power Control.
Jan 01 00:00:46 vegman-s2600wf kernel: i2c i2c-7: new_device: Instantiate=
d device eeprom at 0x51
Jan 01 00:00:46 vegman-s2600wf nscd[151]: 151 ignored inotify event for `=
/etc/resolv.conf` (file exists)
Jan 01 00:00:46 vegman-s2600wf systemd[1]: Starting Intel Power Control..=
=2E
Jan 01 00:00:46 vegman-s2600wf systemd[1]: Starting Phosphor Version Soft=
ware Manager...
Jan 01 00:00:46 vegman-s2600wf kernel: i2c i2c-7: new_device: Instantiate=
d device pmbus at 0x59
Jan 01 00:00:47 vegman-s2600wf kernel: i2c i2c-1: new_device: Instantiate=
d device eeprom at 0x57
Jan 01 00:00:47 vegman-s2600wf power-control[277]: Start Chassis power co=
ntrol service...
Jan 01 00:00:47 vegman-s2600wf kernel: lm75 1-004d: hwmon4: sensor 'tmp75=
'
Jan 01 00:00:47 vegman-s2600wf kernel: i2c i2c-1: new_device: Instantiate=
d device tmp75 at 0x4d
Jan 01 00:00:47 vegman-s2600wf swampd[269]: No fan zones, application pau=
sing until new configuration
Jan 01 00:00:47 vegman-s2600wf phosphor-mapper[189]: Introspect call fail=
ed with error: generic:53, Invalid request descriptor on process: xyz.ope=
nbmc_project.Hwmon.external path: /
Jan 01 00:00:47 vegman-s2600wf phosphor-mapper[189]: Introspect call fail=
ed with error: generic:113, No route to host on process: xyz.openbmc_proj=
ect.State.Host path: /
Jan 01 00:00:47 vegman-s2600wstemd[1]: xyz.openbmc_project.Chassis.Contro=
l.Power.service: Failed with result 'signal'.
Jan 01 00:00:48 vegman-s2600wf systemd[1]: Failed to start Intel Power Co=
ntrol.
Jan 01 00:00:48 vegman-s2600wf phosphor-network-manager[236]: Refreshing =
the objects.
Jan 01 00:00:48 vegman-s2600wf entity-manager[203]: Unable to find type f=
or 2U12x35 Riser2 reverting to Chassis.
Jan 01 00:00:48 vegman-s2600wf obmc-ikvm[288]: Failed to open input devic=
e
Jan 01 00:00:48 vegman-s2600wf obmc-ikvm[288]: Failed to open a file
Jan 01 00:00:48 vegman-s2600wf obmc-ikvm[288]: terminate called after thr=
owing an instance of 'sdbusplus::xyz::openbmc_project::Common::File::Erro=
r::Open'
Jan 01 00:00:48 vegman-s2600wf obmc-ikvm[288]:   what():  xyz.openbmc_pro=
ject.Common.File.Error.Open: Failed to open a file
Jan 01 00:00:48 vegman-s2600wf phosphor-network-manager[236]: ioctl faile=
d for SIOCETHTOOL:
Jan 01 00:00:49 vegman-s2600wf systemd[1]: start-ipkvm.service: Main proc=
ess exited, code=3Dkilled, status=3D6/ABRT
Jan 01 00:00:49 vegman-s2600wf systemd[1]: start-ipkvm.service: Failed wi=
th result 'signal'.
Jan 01 00:00:49 vegman-s2600wf phosphor-network-manager[236]: ioctl faile=
d for SIOCETHTOOL:
Jan 01 00:00:50 vegman-s2600wf systemd[1]: start-ipkvm.service: Service R=
estartSec=3D1s expired, scheduling restart.
Jan 01 00:00:50 vegman-s2600wf phosphor-mapper[189]: Introspect call fail=
ed with error: generic:53, Invalid request descriptor on process: xyz.ope=
nbmc_project.State.FanCtrl path: /
Jan 01 00:00:50 vegman-s2600wf systemd[1]: start-ipkvm.service: Scheduled=
 restart job, restart counter is at 2.
Jan 01 00:00:51 vegman-s2600wf psusensor[251]: Driver name tmp75 not foun=
d in sensor whitelist
Jan 01 00:00:51 vegman-s2600wf psusensor[251]: Driver name tmp75 not foun=
d in sensor whitelist
Jan 01 00:00:51 vegman-s2600wf psusensor[251]: Driver name aspeed_pwm_tac=
ho not found in sensor whitelist
Jan 01 00:00:51 vegman-s2600wf phosphor-certificate-manager[155]: Writing=
 private key to file
Jan 01 00:00:51 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Service RestartSec=3D3s expired, scheduling restart.=

Jan 01 00:00:51 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Scheduled restart job, restart counter is at 2.
Jan 01 00:00:52 vegman-s2600wf ipmid[267]: JSON file not found
Jan 01 00:00:52 vegman-s2600wf hwmontempsensor[246]: failed to find match=
 for 1-004d
Jan 01 00:00:52 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon5/fan1_input" has no corresponding label file
Jan 01 00:00:52 vegman-s2600wf hwmontempsensor[246]: failed to find match=
 for 7-0058
Jan 01 00:00:52 vegman-s2600wf hwmontempsensor[246]: failed to find match=
 for 7-0059
Jan 01 00:00:52 vegman-s2600wf systemd[1]: Started Phosphor Version Softw=
are Manager.
Jan 01 00:00:52 vegman-s2600wf psusensor[251]: could not find vout1 in th=
e Labels list
Jan 01 00:00:52 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon5/temp2_input" has no corresponding label file
Jan 01 00:00:52 vegman-s2600wf psusensor[251]: could not find temp2 in th=
e Labels list
Jan 01 00:00:52 vegman-s2600wf psusensor[251]: could not find iout2 in th=
e Labels list
Jan 01 00:00:52 vegman-s2600wf psusensor[251]: could not find pout2 in th=
e Labels list
Jan 01 00:00:52 vegman-s2600wf rngd[102]: Initializing available sources
Jan 01 00:00:53 vegman-s2600wf systemd[1]: Stopped OpenBMC ipKVM daemon.
Jan 01 00:00:53 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon5/temp1_input" has no corresponding label file
Jan 01 00:00:53 vegman-s2600wf system1] <group/member=3D"systemd-network"=
> no available LDAP server found: Can't contact LDAP server: Transport en=
dpoint is not connected
Jan 01 00:00:53 vegman-s2600wf nslcd[206]: [b0dc51] <group/member=3D"syst=
emd-network"> no available LDAP server found: Server is unavailable: Tran=
sport endpoint is not connected
Jan 01 00:00:53 vegman-s2600wf systemd[1]: Starting Network Service...
Jan 01 00:00:54 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon3/fan1_input" has no corresponding label file
Jan 01 00:00:54 vegman-s2600wf systemd[1]: Stopped Intel Power Control.
Jan 01 00:00:54 vegman-s2600wf psusensor[251]: could not find vout1 in th=
e Labels list
Jan 01 00:00:54 vegman-s2600wf systemd[1]: Starting Intel Power Control..=
=2E
Jan 01 00:00:54 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon3/temp2_input" has no corresponding label file
Jan 01 00:00:54 vegman-s2600wf psusensor[251]: could not find temp2 in th=
e Labels list
Jan 01 00:00:54 vegman-s2600wf psusensor[251]: could not find iout2 in th=
e Labels list
Jan 01 00:00:54 vegman-s2600wf psusensor[251]: could not find pout2 in th=
e Labels list
Jan 01 00:00:54 vegman-s2600wf systemd[1]: Condition check resulted in Ph=
osphor Hwmon Poller being skipped.
Jan 01 00:00:54 vegman-s2600wf systemd[1]: Condition check resulted in Ph=
osphor Hwmon Poller being skipped.
Jan 01 00:00:54 vegman-s2600wf power-control[302]: Start Chassis power co=
ntrol service...
Jan 01 00:00:55 vegman-s2600wf power-control[302]: terminate called after=
 throwing an instance of 'sdbusplus::exception::SdBusError'
Jan 01 00:00:55 vegman-s2600wf power-control[302]:   what():  sd_bus_requ=
est_name: org.freedesktop.DBus.Error.FileExists: File exists
Jan 01 00:00:55 vegman-s2600wf systemd[1]: Condition check resulted in Ph=
osphor Hwmon Poller being skipped.
Jan 01 00:00:55 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon3/temp1_input" has no corresponding label file
Jan 01 00:00:55 vegman-s2600wf systemd[1]: Condition check resulted in Ph=
osphor Hwmon Poller being skipped.
Jan 01 00:00:55 vegman-s2600wf systemd[1]: Condition check resulted in Ph=
osphor Hwmon Poller being skipped.
Jan 01 00:00:55 vegman-s2600wf psusensor[251]: Driver name tmp75 not foun=
d in sensor whitelist
Jan 01 00:00:55 vegman-s2600wf psusensor[251]: PredictiveFailure assert
Jan 01 00:00:56 vegman-s2600wf systemd-networkd[301]: eth0: Gained IPv6LL=

Jan 01 00:00:56 vegman-s2600wf rngd[102]: Initializing entropy source hwr=
ng
Jan 01 00:00:56 vegman-s2600wf systemd[1]: Started OpenBMC ipKVM daemon.
Jan 01 00:00:56 vegman-s2600wf systemd-timesyncd[114]: Network configurat=
ion changed, trying to establish connection.
Jan 01 00:00:56 vegman-s2600wf systemd-networkd[301]: Enumeration complet=
ed
Jan 01 00:00:56 vegman-s2600wf systemd-networkd[301]: eth0: Kernel remove=
d an address we don't remember: 169.254.168.46/16 (valid forever), ignori=
ng.
Jan 01 00:00:56 vegman-s2600wf intrusion-sensor[247]: can't find matched =
NIC name.
Jan 01 00:00:56 vegman-s2600wf intrusion-sensor[247]: unexpected eth for =
suffixStr 34
Jan 01 00:00:56 vegman-s2600wf intrusion-sensor[247]: unexpected eth for =
suffixStr 31
Jan 01 00:00:56 vegman-s2600wf systemd[1]: Started Network Service.
Jan 01 00:00:56 vegman-s2600wf systemd-timesyncd[114]: Network configurat=
ion changed, trying to establish connection.
Jan 01 00:00:56 vegman-s2600wf systemd-networkd[301]: eth1: IPv6 successf=
ully enabled
Jan 01 00:00:56 vegman-s2600wf systemd-timesyncd[114]: Network configurat=
ion changed, trying to establish connection.
Jan 01 00:00:56 vegman-s2600wf systemd-networkd[301]o open a file
Jan 01 00:00:57 vegman-s2600wf obmc-ikvm[304]: terminate called after thr=
owing an instance of 'sdbusplus::xyz::openbmc_project::Common::File::Erro=
r::Open'
Jan 01 00:00:57 vegman-s2600wf obmc-ikvm[304]:   what():  xyz.openbmc_pro=
ject.Common.File.Error.Open: Failed to open a file
Jan 01 00:00:57 vegman-s2600wf systemd[1]: start-ipkvm.service: Main proc=
ess exited, code=3Dkilled, status=3D6/ABRT
Jan 01 00:00:57 vegman-s2600wf systemd[1]: start-ipkvm.service: Failed wi=
th result 'signal'.
Jan 01 00:00:57 vegman-s2600wf psusensor[251]: Driver name tmp75 not foun=
d in sensor whitelist
Jan 01 00:00:57 vegman-s2600wf psusensor[251]: Driver name tmp75 not foun=
d in sensor whitelist
Jan 01 00:00:57 vegman-s2600wf psusensor[251]: Driver name aspeed_pwm_tac=
ho not found in sensor whitelist
Jan 01 00:00:58 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon5/fan1_input" has no corresponding label file
Jan 01 00:00:58 vegman-s2600wf phosphor-mapper[189]: Introspect call fail=
ed with error: generic:113, No route to host on process: xyz.openbmc_proj=
ect.State.Host path: /
Jan 01 00:00:58 vegman-s2600wf phosphor-network-manager[236]: Refreshing =
complete.
Jan 01 00:00:58 vegman-s2600wf systemd[1]: Started Hostname Service.
Jan 01 00:00:58 vegman-s2600wf psusensor[251]: could not find vout1 in th=
e Labels list
Jan 01 00:00:58 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon5/temp2_input" has no corresponding label file
Jan 01 00:00:58 vegman-s2600wf psusensor[251]: could not find temp2 in th=
e Labels list
Jan 01 00:00:58 vegman-s2600wf psusensor[251]: could not find iout2 in th=
e Labels list
Jan 01 00:00:58 vegman-s2600wf psusensor[251]: could not find pout2 in th=
e Labels list
Jan 01 00:00:58 vegman-s2600wf systemd[1]: start-ipkvm.service: Service R=
estartSec=3D1s expired, scheduling restart.
Jan 01 00:00:58 vegman-s2600wf systemd[1]: start-ipkvm.service: Scheduled=
 restart job, restart counter is at 3.
Jan 01 00:00:58 vegman-s2600wf systemd[1]: Stopped OpenBMC ipKVM daemon.
Jan 01 00:00:58 vegman-s2600wf systemd[1]: Starting OpenBMC ipKVM daemon.=
=2E.
Jan 01 00:00:59 vegman-s2600wf systemd[1]: Started OpenBMC ipKVM daemon.
Jan 01 00:00:59 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon5/temp1_input" has no corresponding label file
Jan 01 00:00:59 vegman-s2600wf psusensor[251]: Configuration skipping 7-8=
8 because not 7-89
Jan 01 00:00:59 vegman-s2600wf obmc-ikvm[309]: Failed to open input devic=
e
Jan 01 00:00:59 vegman-s2600wf obmc-ikvm[309]: Failed to open a file
Jan 01 00:00:59 vegman-s2600wf obmc-ikvm[309]: terminate called after thr=
owing an instance of 'sdbusplus::xyz::openbmc_project::Common::File::Erro=
r::Open'
Jan 01 00:00:59 vegman-s2600wf obmc-ikvm[309]:   what():  xyz.openbmc_pro=
ject.Common.File.Error.Open: Failed to open a file
Jan 01 00:00:59 vegman-s2600wf systemd[1]: start-ipkvm.service: Main proc=
ess exited, code=3Dkilled, status=3D6/ABRT
Jan 01 00:00:59 vegman-s2600wf systemd[1]: start-ipkvm.service: Failed wi=
th result 'signal'.
Jan 01 00:00:59 vegman-s2600wf ipmid[267]: Registering OEM:[0X00C2CF], Cm=
d:[0X04] for Manual Zone Control
Jan 01 00:01:00 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon3/fan1_input" has no corresponding label file
Jan 01 00:01:00 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Service RestartSec=3D3s expired, scheduling restart.=

Jan 01 00:01:00 vegman-s2600wf psusensor[251]: could not find vout1 in th=
e Labels list
Jan 01 00:01:00 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon3/temp2_input" has no cesulted in Check Host0 status on BMC reset=
 being skipped.
Jan 01 00:01:00 vegman-s2600wf agetty[232]: ttyS4: invalid character 0x13=
 in login name
Jan 01 00:01:00 vegman-s2600wf psusensor[251]: Input file "/sys/class/hwm=
on/hwmon3/temp1_input" has no corresponding label file
Jan 01 00:01:00 vegman-s2600wf systemd[1]: Reached target Host0 running a=
fter reset.
Jan 01 00:01:00 vegman-s2600wf systemd[1]: Condition check resulted in St=
art host0 running after BMC reset being skipped.
Jan 01 00:01:00 vegman-s2600wf systemd[1]: Stopped Intel Power Control.
Jan 01 00:01:01 vegman-s2600wf systemd[1]: Starting Intel Power Control..=
=2E
Jan 01 00:01:01 vegman-s2600wf psusensor[251]: Driver name tmp75 not foun=
d in sensor whitelist
Jan 01 00:01:01 vegman-s2600wf systemd[1]: start-ipkvm.service: Service R=
estartSec=3D1s expired, scheduling restart.
Jan 01 00:01:01 vegman-s2600wf psusensor[251]: PredictiveFailure assert
Jan 01 00:01:01 vegman-s2600wf systemd[1]: start-ipkvm.service: Scheduled=
 restart job, restart counter is at 4.
Jan 01 00:01:01 vegman-s2600wf systemd[1]: Stopped OpenBMC ipKVM daemon.
Jan 01 00:01:01 vegman-s2600wf systemd[1]: start-ipkvm.service: Start req=
uest repeated too quickly.
Jan 01 00:01:01 vegman-s2600wf power-control[315]: Start Chassis power co=
ntrol service...
Jan 01 00:01:01 vegman-s2600wf systemd[1]: start-ipkvm.service: Failed wi=
th result 'signal'.
Jan 01 00:01:01 vegman-s2600wf systemd[1]: Failed to start OpenBMC ipKVM =
daemon.
Jan 01 00:01:01 vegman-s2600wf kcsbridged[312]: Couldn't open SMS channel=
 O_RDWR
Jan 01 00:01:01 vegman-s2600wf systemd[1]: phosphor-ipmi-kcs@ipmi-kcs3.se=
rvice: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:01:01 vegman-s2600wf systemd[1]: phosphor-ipmi-kcs@ipmi-kcs3.se=
rvice: Failed with result 'exit-code'.
Jan 01 00:01:02 vegman-s2600wf power-control[315]: terminate called after=
 throwing an instance of 'sdbusplus::exception::SdBusError'
Jan 01 00:01:02 vegman-s2600wf power-control[315]:   what():  sd_bus_requ=
est_name: org.freedesktop.DBus.Error.FileExists: File exists
Jan 01 00:01:02 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Main process exited, code=3Dkilled, status=3D6/ABRT
Jan 01 00:01:02 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Failed with result 'signal'.
Jan 01 00:01:02 vegman-s2600wf systemd[1]: Failed to start Intel Power Co=
ntrol.
Jan 01 00:01:02 vegman-s2600wf phosphor-mapper[189]: Introspect call fail=
ed with error: generic:113, No route to host on process: xyz.openbmc_proj=
ect.State.Host path: /
Jan 01 00:01:02 vegman-s2600wf netipmid[313]: Failed to get bus name
Jan 01 00:01:03 vegman-s2600wf avahi-daemon[202]: Joining mDNS multicast =
group on interface eth0.IPv4 with address 169.254.168.46.
Jan 01 00:01:03 vegman-s2600wf avahi-daemon[202]: New relevant interface =
eth0.IPv4 for mDNS.
Jan 01 00:01:03 vegman-s2600wf avahi-daemon[202]: Registering new address=
 record for 169.254.168.46 on eth0.IPv4.
Jan 01 00:01:03 vegman-s2600wf ipmid[267]: Loading whitelist filter
Jan 01 00:01:03 vegman-s2600wf systemd[1]: phosphor-ipmi-kcs@ipmi-kcs3.se=
rvice: Service RestartSec=3D1s expired, scheduling restart.
Jan 01 00:01:03 vegman-s2600wf systemd[1]: phosphor-ipmi-kcs@ipmi-kcs3.se=
rvice: Scheduled restart job, restart counter is at 1.
Jan 01 00:01:03 vegman-s2600wf systemd[1]: Stopped Phosphor IPMI KCS DBus=
 Bridge.
Jan 01 00:01:03 vegman-s2600wf systemd[1]: Started Phosphor IPMI KCS DBus=
 Bridge.
Jan 01 00:01:03 vegman-s2600wf kcsbridged[319]: Couldn't open SMS channel=
 O_RDWR
Jan 01 00:01:03 vegman-s2600wf swampd[269:05 vegman-s2600wf systemd[1]: p=
hosphor-ipmi-kcs@ipmi-kcs3.service: Service RestartSec=3D1s expired, sche=
duling restart.
Jan 01 00:01:05 vegman-s2600wf systemd[1]: phosphor-ipmi-kcs@ipmi-kcs3.se=
rvice: Scheduled restart job, restart counter is at 2.
Jan 01 00:01:05 vegman-s2600wf ipmid[267]: Set restrictedMode =3D false
Jan 01 00:01:05 vegman-s2600wf ipmid[267]: New interface mapping
Jan 01 00:01:05 vegman-s2600wf systemd[1]: Stopped Phosphor IPMI KCS DBus=
 Bridge.
Jan 01 00:01:05 vegman-s2600wf systemd[1]: phosphor-ipmi-kcs@ipmi-kcs3.se=
rvice: Start request repeated too quickly.
Jan 01 00:01:05 vegman-s2600wf systemd[1]: phosphor-ipmi-kcs@ipmi-kcs3.se=
rvice: Failed with result 'exit-code'.
Jan 01 00:01:05 vegman-s2600wf systemd[1]: Failed to start Phosphor IPMI =
KCS DBus Bridge.
Jan 01 00:01:05 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Service RestartSec=3D3s expired, scheduling restart.=

Jan 01 00:01:05 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Scheduled restart job, restart counter is at 4.
Jan 01 00:01:05 vegman-s2600wf systemd[1]: Stopped Intel Power Control.
Jan 01 00:01:05 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Start request repeated too quickly.
Jan 01 00:01:05 vegman-s2600wf systemd[1]: xyz.openbmc_project.Chassis.Co=
ntrol.Power.service: Failed with result 'signal'.
Jan 01 00:01:05 vegman-s2600wf systemd[1]: Failed to start Intel Power Co=
ntrol.
Jan 01 00:01:07 vegman-s2600wf systemd[1]: Started Phosphor Download Mana=
ger.
Jan 01 00:01:07 vegman-s2600wf download_manager.py[152]: Running Download=
 Manager
Jan 01 00:01:07 vegman-s2600wf systemd[1]: Started Wait for /org/openbmc/=
managers/Download.
Jan 01 00:01:07 vegman-s2600wf systemd[1]: Starting Phosphor BMC Code Upd=
ate...
Jan 01 00:01:08 vegman-s2600wf phosphor-network-manager[236]: Refreshing =
the objects.
Jan 01 00:01:08 vegman-s2600wf phosphor-network-manager[236]: ioctl faile=
d for SIOCETHTOOL:
Jan 01 00:01:08 vegman-s2600wf phosphor-network-manager[236]: ioctl faile=
d for SIOCETHTOOL:
Jan 01 00:01:08 vegman-s2600wf phosphor-network-manager[236]: Refreshing =
complete.
Jan 01 00:01:10 vegman-s2600wf systemd[1]: serial-getty@ttyS4.service: Su=
cceeded.
Jan 01 00:01:10 vegman-s2600wf systemd[1]: serial-getty@ttyS4.service: Se=
rvice has no hold-off time (RestartSec=3D0), scheduling restart.
Jan 01 00:01:10 vegman-s2600wf systemd[1]: serial-getty@ttyS4.service: Sc=
heduled restart job, restart counter is at 1.
Jan 01 00:01:10 vegman-s2600wf systemd[1]: Stopped Serial Getty on ttyS4.=

Jan 01 00:01:10 vegman-s2600wf systemd[1]: Started Serial Getty on ttyS4.=

Jan 01 00:01:12 vegman-s2600wf kernel: ------------[ cut here ]----------=
--
Jan 01 00:01:12 vegman-s2600wf kernel: WARNING: CPU: 0 PID: 331 at net/sc=
hed/sch_generic.c:447 dev_watchdog+0x268/0x288
Jan 01 00:01:12 vegman-s2600wf kernel: NETDEV WATCHDOG: eth0 (ftgmac100):=
 transmit queue 0 timed out
Jan 01 00:01:12 vegman-s2600wf kernel: CPU: 0 PID: 331 Comm: python Not t=
ainted 5.3.10-7b61b9e #1
Jan 01 00:01:12 vegman-s2600wf kernel: Hardware name: Generic DT based sy=
stem
Jan 01 00:01:12 vegman-s2600wf kernel: Backtrace:=20
Jan 01 00:01:12 vegman-s2600wf kernel: [<80107c84>] (dump_backtrace) from=
 [<80107eb8>] (show_stack+0x20/0x24)
Jan 01 00:01:12 vegman-s2600wf kernel:  r7:80a12d20 r6:00000000 r5:997237=
8c r4:00000009
Jan 01 00:01:12 vegman-s2600wf kernel: [<80107e98>] (show_stack) from [<8=
06a84b0>] (dump_stack+0x20/0x28)
Jan 01 00:01:12 vegman-s2600wf kernel: [<806a8490>] (dump_stack) from [<8=
0116900>] (__warn.part.0+0xb4/0xdc)
Jann 01 00:01:12 vegman-s2600wf kernel: [<8015ad54>] (call_timer_fn) from=
 [<8015af18>] (expire_timers+0xa0/0xdc)
Jan 01 00:01:12 vegman-s2600wf kernel:  r8:ffffa6f8 r7:80a13a40 r6:997238=
54 r5:99723854 r4:9909422c
Jan 01 00:01:12 vegman-s2600wf kernel: [<8015ae78>] (expire_timers) from =
[<8015aff4>] (run_timer_softirq+0xa0/0x198)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000002 r9:00000100 r8:80a12=
d20 r7:80a13a40 r6:80a13a40 r5:99723854
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:99723854 r3:ffffa6f9
Jan 01 00:01:12 vegman-s2600wf kernel: [<8015af54>] (run_timer_softirq) f=
rom [<801022b4>] (__do_softirq+0xdc/0x314)
Jan 01 00:01:12 vegman-s2600wf kernel:  r8:00000000 r7:99722000 r6:80a623=
34 r5:00000002 r4:00000001
Jan 01 00:01:12 vegman-s2600wf kernel: [<801021d8>] (__do_softirq) from [=
<8011a93c>] (irq_exit+0xac/0xe4)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:98e186dc r9:99722000 r8:00000=
000 r7:9d413600 r6:00000001 r5:80a4a5d8
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:00000000
Jan 01 00:01:12 vegman-s2600wf kernel: [<8011a890>] (irq_exit) from [<801=
4d1f4>] (__handle_domain_irq+0x60/0xb4)
Jan 01 00:01:12 vegman-s2600wf kernel: [<8014d194>] (__handle_domain_irq)=
 from [<801021cc>] (avic_handle_irq+0x68/0x70)
Jan 01 00:01:12 vegman-s2600wf kernel:  r9:99722000 r8:98e18206 r7:997239=
6c r6:ffffffff r5:99723938 r4:9d402e40
Jan 01 00:01:12 vegman-s2600wf kernel: [<80102164>] (avic_handle_irq) fro=
m [<80101a6c>] (__irq_svc+0x6c/0x90)
Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723938 to 0x99=
723980)
Jan 01 00:01:12 vegman-s2600wf kernel: 3920:                             =
                          00000460 0000054b
Jan 01 00:01:12 vegman-s2600wf kernel: 3940: 00000008 000002df 98e18000 d=
e785a57 00000008 98e1800e 98e18206 000001cb
Jan 01 00:01:12 vegman-s2600wf kernel: 3960: 98e186dc 997239b4 0a4e3ec5 9=
9723988 00000458 803b58e0 20000013 ffffffff
Jan 01 00:01:12 vegman-s2600wf kernel:  r5:20000013 r4:803b58e0
Jan 01 00:01:12 vegman-s2600wf kernel: [<803b559c>] (lzma_main) from [<80=
3b64ec>] (xz_dec_lzma2_run+0x678/0x824)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:00000000 r8:98e1e=
000 r7:98e1eee8 r6:0000002a r5:98e09a84
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:98e18000 r3:000003fd
Jan 01 00:01:12 vegman-s2600wf kernel: [<803b5e74>] (xz_dec_lzma2_run) fr=
om [<803b4ad4>] (xz_dec_run+0x2d8/0xa78)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:994b0c00 r9:00000000 r8:98e09=
a84 r7:9d608800 r6:00000001 r5:00000001
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:98e09a80
Jan 01 00:01:12 vegman-s2600wf kernel: [<803b47fc>] (xz_dec_run) from [<8=
02c6618>] (squashfs_xz_uncompress+0x8c/0x234)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:994b0c00 r9:98e09a84 r8:98e09=
560 r7:0000001b r6:0000000d r5:00000001
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:98e09a80
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c658c>] (squashfs_xz_uncompre=
ss) from [<802c6538>] (squashfs_decompress+0x68/0xa0)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:98e09560 r9:98e09440 r8:98e09=
444 r7:0000001b r6:994b0c00 r5:802c658c
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:990f4200
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c64d0>] (squashfs_decompress)=
 from [<802c20ac>] (squashfs_read_data+0x404/0x734)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:994b0c68 r8:98e09=
560 r7:994b0bfc r6:0000001b r5:0000026c
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:0000001b
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c1ca8>] (squashfs_read_data) =
from [<802c27b8>] (squashfs_cache_get+0x238/0x388)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000002 r9:9d602fc0 r8:990ba=
7b8 r7:0002600wf kernel:  r10:00112cca r9:00000004 r8:99723cd4 r7:9a05bf0=
0 r6:00000000 r5:9ee5c5e0
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:9ee5c5e4
Jan 01 00:01:12 vegman-s2600wf kernel: [<801fffac>] (read_pages) from [<8=
0200494>] (__do_page_cache_readahead+0x1b8/0x1d8)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:9a05bf04 r9:00112cca r8:99723=
cd4 r7:00000003 r6:00000004 r5:00000004
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:00000003
Jan 01 00:01:12 vegman-s2600wf kernel: [<802002dc>] (__do_page_cache_read=
ahead) from [<802006cc>] (ondemand_readahead+0x218/0x288)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:99f785a0 r8:00000=
000 r7:9a05bf00 r6:00000000 r5:00000003
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:99f785f8
Jan 01 00:01:12 vegman-s2600wf kernel: [<802004b4>] (ondemand_readahead) =
from [<802008b0>] (page_cache_sync_readahead+0x5c/0x7c)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:99723ec0 r9:99723dd8 r8:00000=
000 r7:00000000 r6:00000000 r5:99f785a0
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:9a05bf00
Jan 01 00:01:12 vegman-s2600wf kernel: [<80200854>] (page_cache_sync_read=
ahead) from [<801f8138>] (generic_file_read_iter+0x680/0x970)
Jan 01 00:01:12 vegman-s2600wf kernel: [<801f7ab8>] (generic_file_read_it=
er) from [<80242ef4>] (do_iter_readv_writev+0x150/0x1dc)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:99723ec0 r8:00000=
000 r7:99723ee0 r6:00000000 r5:00000000
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:99f785a0
Jan 01 00:01:12 vegman-s2600wf kernel: [<80242da4>] (do_iter_readv_writev=
) from [<80243940>] (do_iter_read+0xf4/0x1ac)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:00000000 r8:00000=
001 r7:99723ee0 r6:99723ec0 r5:99f785a0
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:00000000
Jan 01 00:01:12 vegman-s2600wf kernel: [<8024384c>] (do_iter_read) from [=
<80244d1c>] (vfs_iter_read+0x28/0x34)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:00000000 r8:00000=
400 r7:99495b40 r6:99723ec0 r5:99723ed8
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:9974d700
Jan 01 00:01:12 vegman-s2600wf kernel: [<80244cf4>] (vfs_iter_read) from =
[<8031e23c>] (ovl_read_iter+0xc0/0x114)
Jan 01 00:01:12 vegman-s2600wf kernel: [<8031e17c>] (ovl_read_iter) from =
[<802442f4>] (__vfs_read+0x150/0x1d4)
Jan 01 00:01:12 vegman-s2600wf kernel:  r7:00000000 r6:00000000 r5:99723f=
60 r4:99495b40
Jan 01 00:01:12 vegman-s2600wf kernel: [<802441a4>] (__vfs_read) from [<8=
0244418>] (vfs_read+0xa0/0x120)
Jan 01 00:01:12 vegman-s2600wf kernel:  r9:00000000 r8:00000001 r7:99723f=
60 r6:0175bec0 r5:99495b40 r4:00000400
Jan 01 00:01:12 vegman-s2600wf kernel: [<80244378>] (vfs_read) from [<802=
44838>] (ksys_read+0x70/0xf8)
Jan 01 00:01:12 vegman-s2600wf kernel:  r9:00000000 r8:00000000 r7:000004=
00 r6:0175bec0 r5:99495b40 r4:99495b40
Jan 01 00:01:12 vegman-s2600wf kernel: [<802447c8>] (ksys_read) from [<80=
2448d8>] (sys_read+0x18/0x1c)
Jan 01 00:01:12 vegman-s2600wf kernel:  r9:99722000 r8:801011e4 r7:000000=
03 r6:76fe64d0 r5:430015bc r4:01695198
Jan 01 00:01:12 vegman-s2600wf kernel: [<802448c0>] (sys_read) from [<801=
01000>] (ret_fast_syscall+0x0/0x54)
Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723fa8 to 0x99=
723ff0)
Jan 01 00:01:12 vegman-s2600wf kernel: 3fa0:                   01695198 4=
30015bc 00000004 0175bec0 00000400 00000000
Jan 01 00:01:12 vegman-s2600wf kernel: 3fc0: 01695198 430015bc 76fe64d0 0=
0000003 000005e8 432d4000 00001001 5dc2157e
Jan 01 00:01:12 vegman-s2600wf kernel: 3fe0: fbad2488 7ee24820 42f2d824 4=
2f85f7c
Jan 01 00:01:12 vegman-s2600wf kernel: ---[ end trace 0910e44f554793b0 ]-=
--
Jan 01 00:01:13 vegman-s2600wf syst01 00:01:38 vegman-s2600wf systemd[1]:=
 dev-ttyVUART0.device: Job dev-ttyVUART0.device/start failed with result =
'timeout'.
Jan 01 00:01:38 vegman-s2600wf systemd[1]: systemd-hostnamed.service: Suc=
ceeded.
Jan 01 00:01:51 vegman-s2600wf login[338]: pam_lastlog(login:session): fi=
le /var/log/lastlog created
Jan 01 00:01:51 vegman-s2600wf nslcd[206]: [495cff] <group/member=3D"root=
"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP se=
rver: Transport endpoint is not connected
Jan 01 00:01:51 vegman-s2600wf nslcd[206]: [495cff] <group/member=3D"root=
"> no available LDAP server found: Can't contact LDAP server: Transport e=
ndpoint is not connected
Jan 01 00:01:51 vegman-s2600wf nslcd[206]: [495cff] <group/member=3D"root=
"> no available LDAP server found: Server is unavailable: Transport endpo=
int is not connected
Jan 01 00:01:51 vegman-s2600wf login[343]: ROOT LOGIN  on '/dev/ttyS4'
Jan 01 00:02:04 vegman-s2600wf rngd[102]: Initializing AES buffer
Jan 01 00:02:04 vegman-s2600wf rngd[102]: Enabling JITTER rng support
Jan 01 00:02:04 vegman-s2600wf rngd[102]: Initializing entropy source jit=
ter
Jan 01 00:15:00 vegman-s2600wf systemd[1]: Starting Cleanup of Temporary =
Directories...
Jan 01 00:15:00 vegman-s2600wf systemd[1]: systemd-tmpfiles-clean.service=
: Succeeded.
Jan 01 00:15:00 vegman-s2600wf systemd[1]: Started Cleanup of Temporary D=
irectories.
Jan 01 01:02:06 vegman-s2600wf nslcd[206]: [e8944a] <group/member=3D"root=
"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP se=
rver: Transport endpoint is not connected
Jan 01 01:02:06 vegman-s2600wf nslcd[206]: [e8944a] <group/member=3D"root=
"> no available LDAP server found: Can't contact LDAP server: Transport e=
ndpoint is not connected
Jan 01 01:02:06 vegman-s2600wf nslcd[206]: [e8944a] <group/member=3D"root=
"> no available LDAP server found: Server is unavailable: Transport endpo=
int is not connected


--------------03C4FB865A72F8A2EE67D30E--

--hSAL7GWGFbeZFnHRqlqYGGhW89ezrPfCL--

--aYI1egLQAqBl8rdnFoJ1V6ciD2M1hzcYZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJdzoO1AAoJEOiTWHtbdBeNQygQAKciq/65Lv1n/l3Ge1XeFTTz
wRWL5Jp0yUofDX6KZ5cl+bt42sJkIat6qyZCjxxvapCynb6b29aai5/WTdBQ65Ih
d2EdsWtZ2c6CzUC5I6EkdLbovu9iya/kMglqcIcxTMlvV2P657UZmH5QVt7wcjRA
pEIFe1DzCl/NkDPV4JLHE72vStIwgX/9n2ONk8EFXjcoDV1AUJAY33IGy12PrJAM
FeJDHW4jRNyTBM3N9kZ5fJ7eaJ2nlILtzfEDl0IcveKzNOvdylPOiVR4F08D3XWl
MF/TlhIIFREEaJWJBvZu6ChIrFLwbwTvrSFUybvOoZgw9/ja9mzprdcNvU9rEXGj
xTgeFGLvifWzGzq+jk1wD6Te3ENc//EPux2s5uaS9ad4f9dBCBftfGVC1M3nN8aM
barsvt/ksGvzfz+pqd5PJjS8OcPP+28etYe5FCxGDQiSi5ae32zCSE+rmziQbjoJ
hyGZJ8VYu0Vcbnf+oJ9Hb1XdHroUxZI8WxLdHLIXXexu3iMKs4Y1ql0jW+52LgVn
g/Bofe4VSOeBnMpPlCZpNLA+UGlf3vvyxoPvQ2Dil6/GwP2M9EUC4nX0ZdzoQc4L
kAMEe9iCsI/XuT4mqXrUnQDO2sj12OY0mknD1aXM9Kv71bK6wkV013cEfAadCkSx
XAD3XCe3WXZYggf+lyNw
=RBtq
-----END PGP SIGNATURE-----

--aYI1egLQAqBl8rdnFoJ1V6ciD2M1hzcYZ--
