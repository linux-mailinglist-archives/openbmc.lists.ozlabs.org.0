Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB04F34FE
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 17:51:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4788Yk1XHRzF6Lx
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 03:51:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4788Xn73LbzF6Ds
 for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2019 03:50:32 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id D20535C08B;
 Thu,  7 Nov 2019 11:50:26 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: thoughts on data and backward and forward compatibility
Message-Id: <B3014CCC-6479-4376-8413-1C07DCFDB4A2@fuzziesquirrel.com>
Date: Thu, 7 Nov 2019 11:50:26 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3601.0.10)
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

I would like for OpenBMC to support forward and backward compatibility.  =
This means changing the code in both directions without having to do a =
factory reset.  Is anyone opposed to maintaining backward compatibility?

To that ^ end, I would like to talk about application data and where to =
put it.  The output of the discussion would be a set of guidelines (e.g. =
something in openbmc/docs) on where to put data to achieve that.  I=E2=80=99=
m making assertions below but please poke holes.

Most of our applications have data.  Often times it gets stashed in /etc =
and most times that is probably not the best place to put it.  Some =
common places to put data on *-nix systems are:

/etc
/usr/share/<package>
/var/lib/<package>
/var/cache/<package>

The following are guidelines and examples to help decide the location in =
which you place your data.

---
/etc
---
This is static data.  Applications that consume data here should not =
write to it.  Other applications or end-users may write to it.

Data in /etc is hard to maintain forward and backward compatibility.  =
When a package that consumes this data is upgraded and it has a new data =
format, the new package must continue to support the old data format or =
a package installation process must detect the old data format and =
migrate it to the new data format.  The latter (migration) makes the =
possibility of backwards compatibility unlikely.

Further complicating the process, other applications or users may write =
data here and that data must be =E2=80=9Cmerged=E2=80=9D during any =
migration process.

Given the challenges, avoid placing data in /etc unless it is necessary.

---
/usr/share/<package>
---
This is also static data and applications that consume data here should =
not write to this data either.

Data where changes from the user or other applications does not need to =
survive a package upgrade should be placed here.  Applications can =
change the format of their data found here and need not worry about =
backwards or forwards compatibility.

=E2=80=94--
/var/lib/<package>
=E2=80=94--
This is dynamic, mutable data.  If your application writes data, it =
should go here (with one exception below).  Just like in /etc, data here =
is also hard to maintain forward and backward compatibility, and just =
like in /etc, applications need to support old and new data formats =
simultaneously or have data migration.  Applications other than the =
consumer or end-users should not modify data here so data merging is not =
required.

=E2=80=94--
/var/cache/<package>
=E2=80=94--
This is also dynamic, mutable data.  If your data can be deleted at any =
time without impacting the state of the application, the data should go =
here.  Data here need not be forward/backward compatible - package =
upgrades or applications can simply remove this data at upgrade or =
startup time.

thx - brad=
