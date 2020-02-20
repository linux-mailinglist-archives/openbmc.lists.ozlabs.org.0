Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F271663C9
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 18:03:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ngrg2jMQzDqXR
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 04:02:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Ngqc6pcHzDqSl
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 04:02:03 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: =?utf-8?B?UmU6IOWbnuimhu+8mnNrZWxldG9u?=
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Priority: 3
In-Reply-To: <-sifmi5quxtt6-92q1n5-wyg6ssnts50d-w3mxqcpkbefz-35tf4ixc78y0-97rd5o-shjcwj2at2netjz0rthkxa46-tez059-yjezs9-f6thaysp4k1b6xrwf-6pqhrjbvxja7-b3yx80-86m5ir-5rqmyn.1582160771127@email.android.com>
Date: Thu, 20 Feb 2020 12:01:54 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <8B4E6F11-7BB9-49D7-81B8-83FB2397283D@fuzziesquirrel.com>
References: <-3ba5uk-q8utwbge8025-qgehlm-fki8rr7khfu1-p6nczl-6suqdm-6kinuh-56lojropdia6g2uvvm-yjw858-7vs2zw-7n6ouz-c58rf1jalry2-ykhwcn-gv83n533ioofq6fq28-2f5aeoa69232-g6kqx5.1581420554253@email.android.com>
 <2ABDDF61-AF88-4777-9D51-1D5FA65293B6@fuzziesquirrel.com>
 <-sifmi5quxtt6-92q1n5-wyg6ssnts50d-w3mxqcpkbefz-35tf4ixc78y0-97rd5o-shjcwj2at2netjz0rthkxa46-tez059-yjezs9-f6thaysp4k1b6xrwf-6pqhrjbvxja7-b3yx80-86m5ir-5rqmyn.1582160771127@email.android.com>
To: =?utf-8?B?4oCq4oCq4oCq4oCqSmVmZiBDaGFu4oCs4oCs4oCs4oCs?=
 <ckimchan17@gmail.com>
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



> On Feb 19, 2020, at 8:06 PM, =E2=80=AA=E2=80=AA=E2=80=AA=E2=80=AAJeff =
Chan=E2=80=AC=E2=80=AC=E2=80=AC=E2=80=AC <ckimchan17@gmail.com> wrote:
>=20
> Hi Brad,
> Thanks for reply, I checked  github.com/openbmc/skeleton, most of them =
released 2 years ago, and the title said "will be replaced...", is it =
still good to adopt it?=20

No I would not recommend that.  Skeleton covers a lot of BMC functions - =
which one in particular are you interested in?

>=20
> Jeff
>=20
>=20
> -------- =E5=8E=9F=E5=A7=8B=E9=83=B5=E4=BB=B6 --------
> =E5=AF=84=E4=BB=B6=E8=80=85=EF=BC=9A Brad Bishop =
<bradleyb@fuzziesquirrel.com>
> =E6=97=A5=E6=9C=9F=EF=BC=9A 2020=E5=B9=B42=E6=9C=8814=E6=97=A5 =E9=80=B1=
=E4=BA=94 02:39
> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A =E2=80=AA=E2=80=AA=E2=80=AA=E2=80=AA=
Jeff Chan=E2=80=AC=E2=80=AC=E2=80=AC=E2=80=AC <ckimchan17@gmail.com>
> =E5=89=AF=E6=9C=AC=EF=BC=9A OpenBMC Maillist =
<openbmc@lists.ozlabs.org>
> =E4=B8=BB=E6=97=A8=EF=BC=9A Re: skeleton
>=20
>=20
> > On Feb 11, 2020, at 6:29 AM, =E2=80=AA=E2=80=AA=E2=80=AA=E2=80=AAJeff =
Chan=E2=80=AC=E2=80=AC=E2=80=AC=E2=80=AC <ckimchan17@gmail.com> wrote:
> >=20
> > Hi,
> > As the description in skeleton github, it will be replaced with =
proper implementation, what's the up to date implementation? where can I =
find those docs or samples?
> >=20
> > Jeff
>=20
> Hi Jeff
>=20
> Most of skeleton has been rewritten.  skeleton covers a lot of BMC =
functions - which one in particular are you interested in?
>=20
> thx -brad
