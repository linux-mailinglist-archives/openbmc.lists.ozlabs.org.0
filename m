Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC9191A53
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 01:48:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BYfD401zzDr9M
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 09:48:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FE88JUO8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nShhkZq0"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BYdN0YS5zDr1q
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 09:47:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 804362134B;
 Sun, 18 Aug 2019 19:47:30 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 18 Aug 2019 19:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=7DV79
 UX8G4yQ+kkOKH5yyZ2JQ7a6LgxLjpAeaLEzq9o=; b=FE88JUO8qeoKb7+j0MU0v
 QvmvfifPi2zHVaiP5BmLEISatcpm1rpEBNL026jhfcukZqndaFO66QEiJmLC3acV
 4xA94IbH7X65tCxNUOBfxI2wJObQsUHJodQKY8/Pms9gYU4fFtegbpnHsDWUwmeJ
 gizQ5pV6qhMNmu4afe88xcFvxpxG41zzvqicUjolfNNTasRrlIjCithbDbMe1jBs
 UdnlTlXgr054bx6SivC17CTjsX+Ch5RAuvWgQX5tKL3wPETyIqxDA6uhn/o0/Uci
 z3udxSX6+n2m5971MRP/PurCgLZHOgU5BddEiLdqTzwZmaS6rzm9mE0GvoRC3XUc
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=7DV79UX8G4yQ+kkOKH5yyZ2JQ7a6LgxLjpAeaLEzq
 9o=; b=nShhkZq0JRTWiUk5w+/L2/MqvlgWzhMeNyCh7QtI9Ig/Ww94j1o3ERscN
 ASY4a4sHNAp9p0KiygQCzhIgONyYm3EQPL3BpGOJ1viW118r7ZKaGROOkVOMnYdJ
 eBJofcggoNNNisQBOD2DZqZD95orDxvJXCQ07OVg7wSqRjfRZuOzhSpZq1UL2qfi
 wnC9yVrIWiBo+1grkyNQ3HkQNm/a7cB+M+DCSNEcAvbEXjyIapiI/KuKRJfsVqP1
 P7pIjikeZJgyfPUq2YHS/v2GImMsROK97jJ8xTy66+TqSVKRQw95mL1NpEVQsmWs
 gDCHClkkqSil3T+1aeVBVGDMjoxJg==
X-ME-Sender: <xms:kuNZXTXjdNY71w1uWqvrtNdlmXfHiRGIJiWA84tF4YRnzjNTnmPTJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefkedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmpdhprhhoohhfphhoihhnthdrtghomhenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvg
 hrufhiiigvpedt
X-ME-Proxy: <xmx:kuNZXd7_u1tyEGaUHLt2FJSc9baryy-NGbcOqA2srxe1RZAK7kWhIQ>
 <xmx:kuNZXeHCaHgDlY7rMs_is3XNUF0fUiSNUe6iAXTYXh0o3gJVDwIYdA>
 <xmx:kuNZXbQ1SqIuK6P7bCan7_jw7Oo0K_OT4Us9dkFVgypoi2u1h09DaQ>
 <xmx:kuNZXV_KWXMq1eR2Es3-D54ZEDlgVlhy2NOvhRtRkZqeJAVlLZk8Fg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 17C11E00A3; Sun, 18 Aug 2019 19:47:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-869-g2d94aad-fmstable-20190814v1
Mime-Version: 1.0
Message-Id: <83870d9c-44cb-4862-ae56-6f2c2760ee1d@www.fastmail.com>
In-Reply-To: <A586CD10-BC88-4316-B900-E3F0874B0910@fb.com>
References: <mailman.545.1565898074.372.openbmc@lists.ozlabs.org>
 <A586CD10-BC88-4316-B900-E3F0874B0910@fb.com>
Date: Mon, 19 Aug 2019 09:17:47 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Wilfred Smith" <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Policy on Tools Posting
Content-Type: text/plain;charset=utf-8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wilfred,

On Fri, 16 Aug 2019, at 07:28, Wilfred Smith wrote:
> My manager (Sai) is asking whether there is precedence for having=20
> utilities posted outside the OpenBMC repository.

As in, outside of the github organisation? There's nothing to stop you f=
rom
doing so (obviously we pull in a lot of software not directly written by=
 the
project), however the thing to consider is whether the tools are general=
ly
useful to the openbmc community. If they are then it's probably best tha=
t
we host them under the github org.

> Do we want 100 OpenBMC=20
> tools repositories, each managed differently or 1 harmonized repositor=
y?

The answer to this is largely down to who maintains what and what their
preferences are.

>=20
> Separately, is there any effort to create a =E2=80=9Ccommon core=E2=80=
=9D for OpenBMC=20
> such that an effort akin to POSIX or the Single UNIX Specification=20
> isn=E2=80=99t needed ten years from now? Without standard API (or at l=
east=20
> abstracted tools) for things like where FRU information is located or=20=

> sending IPMB commands, isn=E2=80=99t the market for innovative softwar=
e stifled=20
> (Android software market vs iOS, or even Linux vs Windows)?=20

Developing a standard set of interfaces is the aim of phosphor-dbus-inte=
rfaces.
We're exploring what's necessary in a bit of an evolutionary way rather =
than
top-down specification. I think that makes the result more flexible and =
open
to input based on different use-cases.

>=20
> Wilfred

Finally, below is the content of a list digest. I have a few requests fo=
r your
future posts:

* Please reply in-line to (i.e. below) the points to which you are respo=
nding,
on a point-by-point basis. This makes the conversation much easier to fo=
llow.

* Try to trim content that's not relevant to the current thread of conve=
rsation.
This keeps your emails concise (I haven't trimmed the digest below becau=
se
it serves to support my point here).

* It looks like you've responded to a digest email from the list that ha=
ppens to
include the thread that you yourself started. Please respond on the thre=
ad
itself, as responding to the digest splinters the conversation (mail cli=
ents that
support threading won't properly track the responses here).

Cheers

Andrew

>=20
> > On Aug 15, 2019, at 12:41 PM, openbmc-request@lists.ozlabs.org wrote=
:
> >=20
> > Send openbmc mailing list submissions to
> > 	openbmc@lists.ozlabs.org
> >=20
> > To subscribe or unsubscribe via the World Wide Web, visit
> > 	https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.ozlabs=
.org_listinfo_openbmc&d=3DDwICAg&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3D-ektT-tD=
9zf2rfUisE63RqiDagGyhGey2hbEGa-47kc&m=3DCsXIqDLC_9ZYrVSwNllcHo7GjqAG9mj2=
S6NymPQTblk&s=3D_RrYmmMf-6XU6r5LsXsWLj8G0K_qaWyo6K2yDU5JGu8&e=3D=20
> > or, via email, send a message with subject or body 'help' to
> > 	openbmc-request@lists.ozlabs.org
> >=20
> > You can reach the person managing the list at
> > 	openbmc-owner@lists.ozlabs.org
> >=20
> > When replying, please edit your Subject line so it is more specific
> > than "Re: Contents of openbmc digest..."
> >=20
> >=20
> > Today's Topics:
> >=20
> >   1. Re: Policy on Tools Posting (Vijay Khemka)
> >   2. [PATCH dev-5.2] fsi: scom: Don't abort operations for minor
> >      errors (Eddie James)
> >   3. Re: [PATCH] net/ncsi: Ensure 32-bit boundary for data cksum
> >      (David Miller)
> >   4. Re: [PATCH v4 2/2] hwmon: pmbus: Add Inspur Power System
> >      power supply driver (Guenter Roeck)
> >=20
> >=20
> > --------------------------------------------------------------------=
--
> >=20
> > Message: 1
> > Date: Thu, 15 Aug 2019 19:07:26 +0000
> > From: Vijay Khemka <vijaykhemka@fb.com>
> > To: Andrew Geissler <geissonator@gmail.com>, Wilfred Smith
> > 	<wilfredsmith@fb.com>
> > Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> > Subject: Re: Policy on Tools Posting
> > Message-ID: <68929B76-8826-4DAD-A29E-DF7A119D00C5@fb.com>
> > Content-Type: text/plain; charset=3D"utf-8"
> >=20
> >=20
> >=20
> > ?On 8/15/19, 5:59 AM, "openbmc on behalf of Andrew Geissler" <openbm=
c-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of geissonator=
@gmail.com> wrote:
> >=20
> >    On Mon, Aug 12, 2019 at 7:58 PM Wilfred Smith <wilfredsmith@fb.co=
m> wrote:
> >>=20
> >>=20
> >> 1. Are there guidelines/procedures specific to submitting command l=
ine tools and utilities? I have heard that there may be a repository and=
/or path dedicated to CLI tools.
> >=20
> >    The community has definitely tended to limit wrapper tools within=

> >    OpenBMC. We had a discussion a while back that we're open to some=
 but
> >    the API's to them really need to be thought out and reviewed beca=
use
> >    command line tools become customer API's (i.e. people start writi=
ng
> >    scripts on top of these tools that then become key to the
> >    manufacturing process or some other critical area).
> >=20
> >    Anything that goes into OpenBMC needs to support OpenBMC interfac=
es.
> >    For example, I'm not familiar with fruid-util's D-bus service
> >    xyz.openbmc_project.FruDevice. A "busctl tree
> >    xyz.openbmc_project.Inventory.Manager | cat" shows the inventory =
items
> >    on OpenBMC.
> >=20
> >    One issue we have within OpenBMC is there may be different
> >    implementations of the D-bus API's for a given area. For example,=

> >    Inventory has different implementations so I'm not sure which rep=
o
> >    would best fit your tool. That type of issue leads me to wonder i=
f we
> >    should put the tools with the interface definitions in
> >    openbmc/phosphor-dbus-interfaces? Or maybe a separate phosphor-to=
ols
> >    repo would be more logical for these.
> > Andrew, I like the idea of having phosphor-tools which can be a plac=
eholder=20
> > for any commandline tools and can grow as per requirement. Currently=

> > it can start with 3 proposed tools.=20
> >=20
> >    Either way, I think command line tools should each get their own
> >    mini-design doc
> >    (https://github.com/openbmc/docs/blob/master/designs/design-templ=
ate.md)
> > Wilfred, Can you please create a document as per this design templat=
e and submit for review.
> >=20
> >    with requirements and interfaces clearly defined for review by th=
e
> >    community. If we can find a generic tool that multiple people fin=
d
> >    useful, we can then find a place to put it. Otherwise, you could =
host
> >    your tools outside of openbmc/ github and just pull them into rec=
ipes
> >    from within your meta-facebook layer.
> >=20
> >> Thanks in advance,
> >>=20
> >> Wilfred
> >=20
> >=20
> >=20
> > ------------------------------
> >=20
> > Message: 2
> > Date: Thu, 15 Aug 2019 14:11:03 -0500
> > From: Eddie James <eajames@linux.ibm.com>
> > To: openbmc@lists.ozlabs.org
> > Cc: joel@jms.id.au, Eddie James <eajames@linux.ibm.com>
> > Subject: [PATCH dev-5.2] fsi: scom: Don't abort operations for minor=

> > 	errors
> > Message-ID: <1565896263-26277-1-git-send-email-eajames@linux.ibm.com=
>
> >=20
> > The scom driver currently fails out of operations if certain system
> > errors are flagged in the status register; system checkstop, special=

> > attention, or recoverable error. These errors won't impact the abili=
ty
> > of the scom engine to perform operations, so the driver should conti=
nue
> > under these conditions.
> > Also, don't do a PIB reset for these conditions, since it won't help=
.
> >=20
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > ---
> > drivers/fsi/fsi-scom.c | 8 +-------
> > 1 file changed, 1 insertion(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> > index 343153d..004dc03 100644
> > --- a/drivers/fsi/fsi-scom.c
> > +++ b/drivers/fsi/fsi-scom.c
> > @@ -38,8 +38,7 @@
> > #define SCOM_STATUS_PIB_RESP_MASK	0x00007000
> > #define SCOM_STATUS_PIB_RESP_SHIFT	12
> >=20
> > -#define SCOM_STATUS_ANY_ERR		(SCOM_STATUS_ERR_SUMMARY | \
> > -					 SCOM_STATUS_PROTECTION | \
> > +#define SCOM_STATUS_ANY_ERR		(SCOM_STATUS_PROTECTION | \
> > 					 SCOM_STATUS_PARITY |	  \
> > 					 SCOM_STATUS_PIB_ABORT | \
> > 					 SCOM_STATUS_PIB_RESP_MASK)
> > @@ -251,11 +250,6 @@ static int handle_fsi2pib_status(struct scom_de=
vice *scom, uint32_t status)
> > 	/* Return -EBUSY on PIB abort to force a retry */
> > 	if (status & SCOM_STATUS_PIB_ABORT)
> > 		return -EBUSY;
> > -	if (status & SCOM_STATUS_ERR_SUMMARY) {
> > -		fsi_device_write(scom->fsi_dev, SCOM_FSI2PIB_RESET_REG, &dummy,
> > -				 sizeof(uint32_t));
> > -		return -EIO;
> > -	}
> > 	return 0;
> > }
> >=20
> > --=20
> > 1.8.3.1
> >=20
> >=20
> >=20
> > ------------------------------
> >=20
> > Message: 3
> > Date: Thu, 15 Aug 2019 12:32:35 -0700 (PDT)
> > From: David Miller <davem@davemloft.net>
> > To: terry.s.duncan@linux.intel.com
> > Cc: sam@mendozajonas.com, netdev@vger.kernel.org,
> > 	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
> > 	wak@google.com, joel@jms.id.au
> > Subject: Re: [PATCH] net/ncsi: Ensure 32-bit boundary for data cksum=

> > Message-ID: <20190815.123235.516041583959546572.davem@davemloft.net>=

> > Content-Type: Text/Plain; charset=3Dus-ascii
> >=20
> > From: "Terry S. Duncan" <terry.s.duncan@linux.intel.com>
> > Date: Tue, 13 Aug 2019 18:18:40 -0700
> >=20
> >> The NCSI spec indicates that if the data does not end on a 32 bit
> >> boundary, one to three padding bytes equal to 0x00 shall be present=
 to
> >> align the checksum field to a 32-bit boundary.
> >>=20
> >> Signed-off-by: Terry S. Duncan <terry.s.duncan@linux.intel.com>
> >> ---
> >> net/ncsi/internal.h |  1 +
> >> net/ncsi/ncsi-cmd.c |  2 +-
> >> net/ncsi/ncsi-rsp.c | 12 ++++++++----
> >> 3 files changed, 10 insertions(+), 5 deletions(-)
> >>=20
> >> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> >> index 0b3f0673e1a2..468a19fdfd88 100644
> >> --- a/net/ncsi/internal.h
> >> +++ b/net/ncsi/internal.h
> >> @@ -185,6 +185,7 @@ struct ncsi_package;
> >> #define NCSI_TO_CHANNEL(p, c)	(((p) << NCSI_PACKAGE_SHIFT) | (c))
> >> #define NCSI_MAX_PACKAGE	8
> >> #define NCSI_MAX_CHANNEL	32
> >> +#define NCSI_ROUND32(x)		(((x) + 3) & ~3) /* Round to 32 bit bound=
ary */
> >=20
> > I think we have enough of a proliferation of alignment macros, let's=
 not add more.
> >=20
> > Either define this to "ALIGN(x, 4)" or expand that into each of the =
locations:
> >=20
> >> 	pchecksum =3D (__be32 *)((void *)h + sizeof(struct ncsi_pkt_hdr) +=

> >> -		    nca->payload);
> >> +		    NCSI_ROUND32(nca->payload));
> >=20
> > 		     ALIGN(nca->payload, 4)
> >=20
> >> -	pchecksum =3D (__be32 *)((void *)(h + 1) + payload - 4);
> >> +	pchecksum =3D (__be32 *)((void *)(h + 1) + NCSI_ROUND32(payload) =
- 4);
> >=20
> > 						 ALIGN(payload, 4)
> >=20
> >=20
> > etc.
> >=20
> >=20
> > ------------------------------
> >=20
> > Message: 4
> > Date: Thu, 15 Aug 2019 12:41:02 -0700
> > From: Guenter Roeck <linux@roeck-us.net>
> > To: Vijay Khemka <vijaykhemka@fb.com>
> > Cc: John Wang <wangzqbj@inspur.com>, "jdelvare@suse.com"
> > 	<jdelvare@suse.com>, "corbet@lwn.net" <corbet@lwn.net>,
> > 	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
> > 	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
> > 	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
> > 	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
> > 	"duanzhijia01@inspur.com" <duanzhijia01@inspur.com>,
> > 	"mine260309@gmail.com" <mine260309@gmail.com>, "joel@jms.id.au"
> > 	<joel@jms.id.au>
> > Subject: Re: [PATCH v4 2/2] hwmon: pmbus: Add Inspur Power System
> > 	power supply driver
> > Message-ID: <20190815194102.GA11916@roeck-us.net>
> > Content-Type: text/plain; charset=3Dutf-8
> >=20
> > On Thu, Aug 15, 2019 at 06:43:52PM +0000, Vijay Khemka wrote:
> >>=20
> >>=20
> >> ?On 8/13/19, 1:36 AM, "openbmc on behalf of John Wang" <openbmc-bou=
nces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of wangzqbj@inspur.=
com> wrote:
> >>=20
> >>    Add the driver to monitor Inspur Power System power supplies
> >>    with hwmon over pmbus.
> >>=20
> >>    This driver adds sysfs attributes for additional power supply da=
ta,
> >>    including vendor, model, part_number, serial number,
> >>    firmware revision, hardware revision, and psu mode(active/standb=
y).
> >>=20
> >>    Signed-off-by: John Wang <wangzqbj@inspur.com>
> >>    ---
> >>    v4:
> >>        - Remove the additional tabs in the Makefile
> >>        - Rebased on 5.3-rc4, not 5.2
> >>    v3:
> >>        - Sort kconfig/makefile entries alphabetically
> >>        - Remove unnecessary initialization
> >>        - Use ATTRIBUTE_GROUPS instead of expanding directly
> >>        - Use memscan to avoid reimplementation
> >>    v2:
> >>        - Fix typos in commit message
> >>        - Invert Christmas tree
> >>        - Configure device with sysfs attrs, not debugfs entries
> >>        - Fix errno in fw_version_read, ENODATA to EPROTO
> >>        - Change the print format of fw-version
> >>        - Use sysfs_streq instead of strcmp("xxx" "\n", "xxx")
> >>        - Document sysfs attributes
> >>    ---
> >>     Documentation/hwmon/inspur-ipsps1.rst |  79 +++++++++
> >>     drivers/hwmon/pmbus/Kconfig           |   9 +
> >>     drivers/hwmon/pmbus/Makefile          |   1 +
> >>     drivers/hwmon/pmbus/inspur-ipsps.c    | 226 +++++++++++++++++++=
+++++++
> >>     4 files changed, 315 insertions(+)
> >>     create mode 100644 Documentation/hwmon/inspur-ipsps1.rst
> >>     create mode 100644 drivers/hwmon/pmbus/inspur-ipsps.c
> >>=20
> >>    diff --git a/Documentation/hwmon/inspur-ipsps1.rst b/Documentati=
on/hwmon/inspur-ipsps1.rst
> >>    new file mode 100644
> >>    index 000000000000..aa19f0ccc8b0
> >>    --- /dev/null
> >>    +++ b/Documentation/hwmon/inspur-ipsps1.rst
> >>    @@ -0,0 +1,79 @@
> >>    +Kernel driver inspur-ipsps1
> >>    +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >>    +
> >>    +Supported chips:
> >>    +
> >>    +  * Inspur Power System power supply unit
> >>    +
> >>    +Author: John Wang <wangzqbj@inspur.com>
> >>    +
> >>    +Description
> >>    +-----------
> >>    +
> >>    +This driver supports Inspur Power System power supplies. This d=
river
> >>    +is a client to the core PMBus driver.
> >>    +
> >>    +Usage Notes
> >>    +-----------
> >>    +
> >>    +This driver does not auto-detect devices. You will have to inst=
antiate the
> >>    +devices explicitly. Please see Documentation/i2c/instantiating-=
devices for
> >>    +details.
> >>    +
> >>    +Sysfs entries
> >>    +-------------
> >>    +
> >>    +The following attributes are supported:
> >>    +
> >>    +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >>    +curr1_input             Measured input current
> >>    +curr1_label             "iin"
> >>    +curr1_max               Maximum current
> >>    +curr1_max_alarm         Current high alarm
> >>    +curr2_input		Measured output current in mA.
> >>    +curr2_label		"iout1"
> >>    +curr2_crit              Critical maximum current
> >>    +curr2_crit_alarm        Current critical high alarm
> >>    +curr2_max               Maximum current
> >>    +curr2_max_alarm         Current high alarm
> >>    +
> >> Please align above details.
> >>    +fan1_alarm		Fan 1 warning.
> >>    +fan1_fault		Fan 1 fault.
> >>    +fan1_input		Fan 1 speed in RPM.
> >>    +
> >>    +in1_alarm		Input voltage under-voltage alarm.
> >>    +in1_input		Measured input voltage in mV.
> >>    +in1_label		"vin"
> >>    +in2_input		Measured output voltage in mV.
> >>    +in2_label		"vout1"
> >>    +in2_lcrit               Critical minimum output voltage
> >>    +in2_lcrit_alarm         Output voltage critical low alarm
> >>    +in2_max                 Maximum output voltage
> >>    +in2_max_alarm           Output voltage high alarm
> >>    +in2_min                 Minimum output voltage
> >>    +in2_min_alarm           Output voltage low alarm
> >>    +
> >>    +power1_alarm		Input fault or alarm.
> >>    +power1_input		Measured input power in uW.
> >>    +power1_label		"pin"
> >>    +power1_max              Input power limit
> >>    +power2_max_alarm	Output power high alarm
> >>    +power2_max              Output power limit
> >>    +power2_input		Measured output power in uW.
> >>    +power2_label		"pout"
> >>    +
> >> Same alignment issue in description.
> >>    +temp[1-3]_input		Measured temperature
> >>    +temp[1-2]_max		Maximum temperature
> >>    +temp[1-3]_max_alarm	Temperature high alarm
> >>    +
> >>    +vendor                  Manufacturer name
> >>    +model                   Product model
> >>    +part_number             Product part number
> >>    +serial_number           Product serial number
> >>    +fw_version              Firmware version
> >>    +hw_version              Hardware version
> >>    +mode                    Work mode. Can be set to active or
> >>    +                        standby, when set to standby, PSU will
> >>    +                        automatically switch between standby
> >>    +                        and redundancy mode.
> >>    +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >>    diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/K=
config
> >>    index b6588483fae1..d62d69bb7e49 100644
> >>    --- a/drivers/hwmon/pmbus/Kconfig
> >>    +++ b/drivers/hwmon/pmbus/Kconfig
> >>    @@ -46,6 +46,15 @@ config SENSORS_IBM_CFFPS
> >>     	  This driver can also be built as a module. If so, the module=
 will
> >>     	  be called ibm-cffps.
> >>=20
> >>    +config SENSORS_INSPUR_IPSPS
> >>    +	tristate "INSPUR Power System Power Supply"
> >>    +	help
> >>    +	  If you say yes here you get hardware monitoring support for =
the INSPUR
> >>    +	  Power System power supply.
> >>    +
> >>    +	  This driver can also be built as a module. If so, the module=
 will
> >>    +	  be called inspur-ipsps.
> >>    +
> >>     config SENSORS_IR35221
> >>     	tristate "Infineon IR35221"
> >>     	help
> >>    diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/=
Makefile
> >>    index c950ea9a5d00..03bacfcfd660 100644
> >>    --- a/drivers/hwmon/pmbus/Makefile
> >>    +++ b/drivers/hwmon/pmbus/Makefile
> >>    @@ -7,6 +7,7 @@ obj-$(CONFIG_PMBUS)		+=3D pmbus_core.o
> >>     obj-$(CONFIG_SENSORS_PMBUS)	+=3D pmbus.o
> >>     obj-$(CONFIG_SENSORS_ADM1275)	+=3D adm1275.o
> >>     obj-$(CONFIG_SENSORS_IBM_CFFPS)	+=3D ibm-cffps.o
> >>    +obj-$(CONFIG_SENSORS_INSPUR_IPSPS) +=3D inspur-ipsps.o
> >>     obj-$(CONFIG_SENSORS_IR35221)	+=3D ir35221.o
> >>     obj-$(CONFIG_SENSORS_IR38064)	+=3D ir38064.o
> >>     obj-$(CONFIG_SENSORS_IRPS5401)	+=3D irps5401.o
> >>    diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/=
pmbus/inspur-ipsps.c
> >>    new file mode 100644
> >>    index 000000000000..fa981b881a60
> >>    --- /dev/null
> >>    +++ b/drivers/hwmon/pmbus/inspur-ipsps.c
> >>    @@ -0,0 +1,226 @@
> >>    +// SPDX-License-Identifier: GPL-2.0-or-later
> >>    +/*
> >>    + * Copyright 2019 Inspur Corp.
> >>    + */
> >>    +
> >>    +#include <linux/debugfs.h>
> >>    +#include <linux/device.h>
> >>    +#include <linux/fs.h>
> >>    +#include <linux/i2c.h>
> >>    +#include <linux/module.h>
> >>    +#include <linux/pmbus.h>
> >>    +#include <linux/hwmon-sysfs.h>
> >>    +
> >>    +#include "pmbus.h"
> >>    +
> >>    +#define IPSPS_REG_VENDOR_ID	0x99
> >>    +#define IPSPS_REG_MODEL		0x9A
> >>    +#define IPSPS_REG_FW_VERSION	0x9B
> >>    +#define IPSPS_REG_PN		0x9C
> >>    +#define IPSPS_REG_SN		0x9E
> >>    +#define IPSPS_REG_HW_VERSION	0xB0
> >>    +#define IPSPS_REG_MODE		0xFC
> >>    +
> >>    +#define MODE_ACTIVE		0x55
> >>    +#define MODE_STANDBY		0x0E
> >>    +#define MODE_REDUNDANCY		0x00
> >>    +
> >>    +#define MODE_ACTIVE_STRING		"active"
> >>    +#define MODE_STANDBY_STRING		"standby"
> >>    +#define MODE_REDUNDANCY_STRING		"redundancy"
> >>    +
> >>    +enum ipsps_index {
> >>    +	vendor,
> >>    +	model,
> >>    +	fw_version,
> >>    +	part_number,
> >>    +	serial_number,
> >>    +	hw_version,
> >>    +	mode,
> >>    +	num_regs,
> >>    +};
> >>    +
> >>    +static const u8 ipsps_regs[num_regs] =3D {
> >>    +	[vendor] =3D IPSPS_REG_VENDOR_ID,
> >>    +	[model] =3D IPSPS_REG_MODEL,
> >>    +	[fw_version] =3D IPSPS_REG_FW_VERSION,
> >>    +	[part_number] =3D IPSPS_REG_PN,
> >>    +	[serial_number] =3D IPSPS_REG_SN,
> >>    +	[hw_version] =3D IPSPS_REG_HW_VERSION,
> >>    +	[mode] =3D IPSPS_REG_MODE,
> >>    +};
> >>    +
> >>    +static ssize_t ipsps_string_show(struct device *dev,
> >>    +				 struct device_attribute *devattr,
> >>    +				 char *buf)
> >>    +{
> >>    +	u8 reg;
> >>    +	int rc;
> >>    +	char *p;
> >>    +	char data[I2C_SMBUS_BLOCK_MAX + 1];
> >>    +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> >>    +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(de=
vattr);
> >>    +
> >>    +	reg =3D ipsps_regs[attr->index];
> >>    +	rc =3D i2c_smbus_read_block_data(client, reg, data);
> >>    +	if (rc < 0)
> >>    +		return rc;
> >>    +
> >>    +	/* filled with printable characters, ending with # */
> >>    +	p =3D memscan(data, '#', rc);
> >>    +	*p =3D '\0';
> >>    +
> >>    +	return snprintf(buf, PAGE_SIZE, "%s\n", data);
> >>    +}
> >>    +
> >>    +static ssize_t ipsps_fw_version_show(struct device *dev,
> >>    +				     struct device_attribute *devattr,
> >>    +				     char *buf)
> >>    +{
> >>    +	u8 reg;
> >>    +	int rc;
> >>    +	u8 data[I2C_SMBUS_BLOCK_MAX] =3D { 0 };
> >>    +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> >>    +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(de=
vattr);
> >>    +
> >>    +	reg =3D ipsps_regs[attr->index];
> >>    +	rc =3D i2c_smbus_read_block_data(client, reg, data);
> >>    +	if (rc < 0)
> >>    +		return rc;
> >>    +
> >>    +	if (rc !=3D 6)
> >>    +		return -EPROTO;
> >>    +
> >>    +	return snprintf(buf, PAGE_SIZE, "%u.%02u%u-%u.%02u\n",
> >>    +			data[1], data[2]/* < 100 */, data[3]/*< 10*/,
> >>    +			data[4], data[5]/* < 100 */);
> >>    +}
> >>    +
> >>    +static ssize_t ipsps_mode_show(struct device *dev,
> >>    +			       struct device_attribute *devattr, char *buf)
> >>    +{
> >>    +	u8 reg;
> >>    +	int rc;
> >>    +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> >>    +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(de=
vattr);
> >>    +
> >>    +	reg =3D ipsps_regs[attr->index];
> >>    +	rc =3D i2c_smbus_read_byte_data(client, reg);
> >>    +	if (rc < 0)
> >>    +		return rc;
> >>    +
> >>    +	switch (rc) {
> >>    +	case MODE_ACTIVE:
> >>    +		return snprintf(buf, PAGE_SIZE, "[%s] %s %s\n",
> >>    +				MODE_ACTIVE_STRING,
> >>    +				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
> >>    +	case MODE_STANDBY:
> >>    +		return snprintf(buf, PAGE_SIZE, "%s [%s] %s\n",
> >>    +				MODE_ACTIVE_STRING,
> >>    +				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
> >>    +	case MODE_REDUNDANCY:
> >>    +		return snprintf(buf, PAGE_SIZE, "%s %s [%s]\n",
> >>    +				MODE_ACTIVE_STRING,
> >>    +				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
> >>    +	default:
> >>    +		return snprintf(buf, PAGE_SIZE, "unspecified\n");
> >>    +	}
> >>    +}
> >>    +
> >>    +static ssize_t ipsps_mode_store(struct device *dev,
> >>    +				struct device_attribute *devattr,
> >>    +				const char *buf, size_t count)
> >>    +{
> >>    +	u8 reg;
> >>    +	int rc;
> >>    +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> >>    +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(de=
vattr);
> >>    +
> >>    +	reg =3D ipsps_regs[attr->index];
> >>    +	if (sysfs_streq(MODE_STANDBY_STRING, buf)) {
> >>    +		rc =3D i2c_smbus_write_byte_data(client, reg,
> >>    +					       MODE_STANDBY);
> >>    +		if (rc < 0)
> >>    +			return rc;
> >>    +		return count;
> >>    +	} else if (sysfs_streq(MODE_ACTIVE_STRING, buf)) {
> >>    +		rc =3D i2c_smbus_write_byte_data(client, reg,
> >>    +					       MODE_ACTIVE);
> >>    +		if (rc < 0)
> >>    +			return rc;
> >>    +		return count;
> >>    +	}
> >>    +
> >>    +	return -EINVAL;
> >>    +}
> >>    +
> >>    +static SENSOR_DEVICE_ATTR_RO(vendor, ipsps_string, vendor);
> >>    +static SENSOR_DEVICE_ATTR_RO(model, ipsps_string, model);
> >>    +static SENSOR_DEVICE_ATTR_RO(part_number, ipsps_string, part_nu=
mber);
> >>    +static SENSOR_DEVICE_ATTR_RO(serial_number, ipsps_string, seria=
l_number);
> >>    +static SENSOR_DEVICE_ATTR_RO(hw_version, ipsps_string, hw_versi=
on);
> >>    +static SENSOR_DEVICE_ATTR_RO(fw_version, ipsps_fw_version, fw_v=
ersion);
> >>    +static SENSOR_DEVICE_ATTR_RW(mode, ipsps_mode, mode);
> >>    +
> >>    +static struct attribute *ipsps_attrs[] =3D {
> >>    +	&sensor_dev_attr_vendor.dev_attr.attr,
> >>    +	&sensor_dev_attr_model.dev_attr.attr,
> >>    +	&sensor_dev_attr_part_number.dev_attr.attr,
> >>    +	&sensor_dev_attr_serial_number.dev_attr.attr,
> >>    +	&sensor_dev_attr_hw_version.dev_attr.attr,
> >>    +	&sensor_dev_attr_fw_version.dev_attr.attr,
> >>    +	&sensor_dev_attr_mode.dev_attr.attr,
> >>    +	NULL,
> >>    +};
> >>    +
> >>    +ATTRIBUTE_GROUPS(ipsps);
> >>    +
> >>    +static struct pmbus_driver_info ipsps_info =3D {
> >>    +	.pages =3D 1,
> >>    +	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOU=
T |
> >>    +		PMBUS_HAVE_IIN | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN |
> >>    +		PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
> >>    +		PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
> >>    +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
> >>    +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
> >> This can be dynamic read by chip identify function
> >=20
> > PMBUS_SKIP_STATUS_CHECK weakens auto-detetcion to some degree,
> > and auto-detection takes time since it needs to poll all registers
> > to determine if they exist. I don't mind if you insist, but I don't
> > immediately see the benefits.
> >=20
> >>    +	.groups =3D ipsps_groups,
> >>    +};
> >>    +
> >>    +static struct pmbus_platform_data ipsps_pdata =3D {
> >>    +	.flags =3D PMBUS_SKIP_STATUS_CHECK,
> >>    +};
> >>    +
> >>    +static int ipsps_probe(struct i2c_client *client,
> >>    +		       const struct i2c_device_id *id)
> >>    +{
> >>    +	client->dev.platform_data =3D &ipsps_pdata;
> >> Allocate memory for this platform data inside tis function rather t=
han having global variable.
> >=20
> > Does that have any value other than consuming more memory
> > if there are multiple instances of the driver ?
> >=20
> >>    +	return pmbus_do_probe(client, id, &ipsps_info);
> >>    +}
> >>    +
> >>    +static const struct i2c_device_id ipsps_id[] =3D {
> >>    +	{ "inspur_ipsps1", 0 },
> >>    +	{}
> >>    +};
> >>    +MODULE_DEVICE_TABLE(i2c, ipsps_id);
> >>    +
> >>    +static const struct of_device_id ipsps_of_match[] =3D {
> >>    +	{ .compatible =3D "inspur,ipsps1" },
> >>    +	{}
> >>    +};
> >>    +MODULE_DEVICE_TABLE(of, ipsps_of_match);
> >>    +
> >>    +static struct i2c_driver ipsps_driver =3D {
> >>    +	.driver =3D {
> >>    +		.name =3D "inspur-ipsps",
> >>    +		.of_match_table =3D ipsps_of_match,
> >>    +	},
> >>    +	.probe =3D ipsps_probe,
> >>    +	.remove =3D pmbus_do_remove,
> >>    +	.id_table =3D ipsps_id,
> >>    +};
> >>    +
> >>    +module_i2c_driver(ipsps_driver);
> >>    +
> >>    +MODULE_AUTHOR("John Wang");
> >>    +MODULE_DESCRIPTION("PMBus driver for Inspur Power System power =
supplies");
> >>    +MODULE_LICENSE("GPL");
> >>    --=20
> >>    2.17.1
> >>=20
> >>=20
> >>=20
> >=20
> >=20
> > End of openbmc Digest, Vol 48, Issue 81
> > ***************************************
>=20
>
