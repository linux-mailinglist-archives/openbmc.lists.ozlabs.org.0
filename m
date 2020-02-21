Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A8E16884B
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 21:23:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PNFf3FfZzDqWS
	for <lists+openbmc@lfdr.de>; Sat, 22 Feb 2020 07:23:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=alL36pBQ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PNCh0xDmzDqWZ
 for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2020 07:21:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1582316503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZVndnXQ6NPYR6x7yir3mwRGjT+UFoQ+DunzVipJaS4=;
 b=alL36pBQ/JHTk/G83lDHpsNq9cMkcO8lwOgLRQItdWfUpbo2t26nj3XhaDvjPQcRLB84/F
 4jUixBEkJNphQJ3xlehXSoNAOcx8G7zhbgqlptvDbOn/Q/of8C3PSsCU7sEcwc9su0FwA1
 nxqtWMsNjTCAc0yYP5imcP0WLbzhi/w=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-c0A5W65YPU2ywySBkexWsA-1; Fri, 21 Feb 2020 15:21:41 -0500
X-MC-Unique: c0A5W65YPU2ywySBkexWsA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 21 Feb 2020 12:21:27 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Fri, 21 Feb 2020 12:21:27 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Patrick Williams <patrick@stwcx.xyz>, Alexander Tereschenko
 <aleksandr.v.tereschenko@linux.intel.com>
Subject: RE: Security Working Group meeting - this Wednesday February 19 -
 summary results
Thread-Topic: Security Working Group meeting - this Wednesday February 19 -
 summary results
Thread-Index: AQHV53kchAwNjm22XUSQsHt720Ts56gkzDCAgAFNSYCAAIOVAP//fAqA
Date: Fri, 21 Feb 2020 20:21:27 +0000
Message-ID: <2c409610c4544e0187e37a5322c6a313@SCL-EXCHMB-13.phoenix.com>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
 <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
 <2b30dde7-3415-8c7a-2001-28793e938339@linux.intel.com>
 <20200221201022.GA67957@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200221201022.GA67957@patrickw3-mbp.dhcp.thefacebook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: openbmc [mailto:openbmc-
> bounces+bruce_mitchell=3Dphoenix.com@lists.ozlabs.org] On Behalf Of
> Patrick Williams
> Sent: Friday, February 21, 2020 12:10
> To: Alexander Tereschenko
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Security Working Group meeting - this Wednesday February
> 19 - summary results
>=20
> On Fri, Feb 21, 2020 at 01:19:25PM +0100, Alexander Tereschenko wrote:
> > On 20-Feb-20 17:26, Patrick Williams wrote:
> > > Can we put something into bmcweb to detect its own certificate has
> > > expired and generate a new one?
> >
> > The idea here is to discourage any prolonged use of the default
> self-signed
> > certs at all, as they don't provide full protection from MitM attacks.
> > That's why the 30 days validity period was suggested (compared to
> current 10
> > years) and discussed during the meeting. Adding an auto-regeneration
> feature
> > would be going directly against that idea, so I personally wouldn't
> vote for
> > that.
>=20
> To me, if bmcweb is handing out an expired self-signed certificate that i=
s
> a bug.  I don't think we should be so heavy-handed to decide for others
> what "secure" means.  We can certainly propose best practices but we
> should not force specific behavior.
>=20
> I'm not suggesting that real certs aren't better than self-signed ones, b=
ut
> some people have a well-isolated management network in a data center
> behind locked doors.  They might decide that the likelihood of MitM
> attack there isn't serious enough to devote engineering resources on a
> certificate distribution scheme. (*)
>=20
> We should keep in mind that part of the original motivation for this
> project, and what keeps certain companies that don't market general-
> purpose servers involved in it, is that they weren't satisfied with the
> constraints being placed on them by the standard offering in the industry=
.
> If we become too heavy-handed here, we also lose that advantage.
>=20

I do not believe that the BMC's self-generated self-signed certificate shou=
ld
be beyond what web browsers will accept (or in the near future).  If the cu=
stomer
wants to install their own self-signed certificate (i.e. not from the BMC) =
then that
is their issue and can do what they want on  their own self-signed certific=
ate.

> > > I know self-signed certs aren't great, but the minute I have more
> than 6
> > > systems I'm not going to want to follow some "BMC Admin Guide" to
> update
> > > certificates by hand.  So we're effectively forcing everyone to
> develop
> > > some kind of certificate management infrastructure, without
> providing
> > > (or pointing to an existing) implementation.
> > I'd say that in such context, you'd be using one of the configuration
> > management systems (Puppet/Chef/Salt/Ansible/homegrown
> scripts/whatnot)
> > anyway, as that's a standard system administration BKM, so IMHO that's
> a
> > reasonable assumption at the OpenBMC project end that it's not going
> to add
> > any noticeable burden for BMC admins.
>=20
> Fair.  But again, others might not feel that is a high enough value
> problem to devote engineering resources to solve.
>=20
> (*) Please don't read this as an implication into how my current
>     employer's management network is or is not designed.
> --
> Patrick Williams

