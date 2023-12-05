Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F54806315
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 00:49:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=UciYDmiG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=oky+kiO5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlHLt53npz3cRk
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 10:49:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=UciYDmiG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=oky+kiO5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlHLB6Y4Zz3cF1
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 10:48:50 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id C09993200B33
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 18:48:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 05 Dec 2023 18:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1701820128; x=
	1701906528; bh=7iflISAiq7E/lAFEVMJ/DVC5qzJidkoyXDxudc84Vck=; b=U
	ciYDmiGKYtV4WOlvGjiVy5Ul/+BAVzd8SILgaEojefUOZBoKMXg+9T+lA4SHO6fo
	gY6TLUrCjwEp7O8iH0Tk9WNMyhhbse2821Rb8Y+UFZ8kDHymsTmS8SBAeTNi3UA6
	gB66VyUeog22zlIl4ZbtWoFspqR2+flplfrjG6WVcit+uG+GslOaY/nrl+wopSHp
	YqYh7EXyqa1AHiXghH6NIEo/E64ZBg93pzogvENT5n0tClhXkT/QvAkByTx4neAl
	9piWJ7EJunLfba4Qo4fauo9MBp6sADTwLA0tEKXmm8N19P7GYTymIAQ4UKClf00I
	4sldGybD4ZUawzZamZj4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1701820128; x=1701906528; bh=7
	iflISAiq7E/lAFEVMJ/DVC5qzJidkoyXDxudc84Vck=; b=oky+kiO5sZWDjwtqz
	xW7O8XAgPr6RfDzarBWjhGBGP3E8luGXrxiEYNsX9hgUHvnoCZS7snId3CeesNxj
	Vvs+FN7M+Io1bvk8NmEp7Mv4+J6pHtxyhs7y2wL6Cx73e27w3eDhCQoQw2I671na
	W8Evbv7cq0DafgS0SFUarV0jiBMzmKgpXKw+6FHO6EfBXYZTgx/rIpWtVUG8HP3L
	yaBdnvfoMxXiZK1LgJD2L4DJYWMq5n+Psa1pSo0CJK/kY/n6KKHNIqLtQcDt3AAM
	xE6wKJY2PF2DlXc0q/2nY3Ouuqs29rICD6empI1+gfzRcelF3pf7GjHtlFFaBwhr
	m5UNg==
X-ME-Sender: <xms:4LZvZe9xJhskwcrCtqT8DGVTbKXrDcA1KqaDKsrxU6jvOFFZxBQQuw>
    <xme:4LZvZetYBayMYRRxuW9FMjW3ircJG5TdW8M5F9J35x-QD9oJLT-OWp5x-jfH84_sy
    JYOgyOZ8IaLemGLSFc>
X-ME-Received: <xmr:4LZvZUBWLsbe7KT4J2wUw--fG9vteDM9VmNOL-qKlI0_tvaeIqBMAlzJaTso6mx6XSXd884PQ0SSk10Rbldr89COelBGQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludejmdenucfjughrpefhvf
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    epffekveduhfettdfgffduffeltddvudfhleduudevveeuvdelkeejkedvkeelgefhnecu
    ffhomhgrihhnpegumhhtfhdrohhrghdpfihikhhiphgvughirgdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehs
    thiftgigrdighiii
X-ME-Proxy: <xmx:4LZvZWelG0ucRr8Ta7z4_6d2pc5F3ZdpOl2yfmqDVKihdOQLUitVTg>
    <xmx:4LZvZTO7l9oZEiIa_hP8fQWTOIW24tVvGMKBeQF4EjNbxtXiU4o_lg>
    <xmx:4LZvZQkjtbJuTz1KG7CXmmTdMeHVXAkngsI9RxbgMicE3ZGyDQgr_A>
    <xmx:4LZvZSaepb28xpcR9qq9-sBKp8tDdQ9tttVaQOYq-C6yi4C6c2Ef3A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 5 Dec 2023 18:48:47 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.6 2/3] net/ncsi: Fix netlink major/minor version numbers
Date: Tue,  5 Dec 2023 17:48:42 -0600
Message-ID: <20231205234843.4013767-2-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205234843.4013767-1-patrick@stwcx.xyz>
References: <20231205234843.4013767-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Peter Delevoryas <peter@pjd.dev>

The netlink interface for major and minor version numbers doesn't actually
return the major and minor version numbers.

It reports a u32 that contains the (major, minor, update, alpha1)
components as the major version number, and then alpha2 as the minor
version number.

For whatever reason, the u32 byte order was reversed (ntohl): maybe it was
assumed that the encoded value was a single big-endian u32, and alpha2 was
the minor version.

The correct way to get the supported NC-SI version from the network
controller is to parse the Get Version ID response as described in 8.4.44
of the NC-SI spec[1].

    Get Version ID Response Packet Format

              Bits
            +--------+--------+--------+--------+
     Bytes  | 31..24 | 23..16 | 15..8  | 7..0   |
    +-------+--------+--------+--------+--------+
    | 0..15 | NC-SI Header                      |
    +-------+--------+--------+--------+--------+
    | 16..19| Response code   | Reason code     |
    +-------+--------+--------+--------+--------+
    |20..23 | Major  | Minor  | Update | Alpha1 |
    +-------+--------+--------+--------+--------+
    |24..27 |         reserved         | Alpha2 |
    +-------+--------+--------+--------+--------+
    |            .... other stuff ....          |

The major, minor, and update fields are all binary-coded decimal (BCD)
encoded [2]. The spec provides examples below the Get Version ID response
format in section 8.4.44.1, but for practical purposes, this is an example
from a live network card:

    root@bmc:~# ncsi-util 0x15
    NC-SI Command Response:
    cmd: GET_VERSION_ID(0x15)
    Response: COMMAND_COMPLETED(0x0000)  Reason: NO_ERROR(0x0000)
    Payload length = 40

    20: 0xf1 0xf1 0xf0 0x00 <<<<<<<<< (major, minor, update, alpha1)
    24: 0x00 0x00 0x00 0x00 <<<<<<<<< (_, _, _, alpha2)

    28: 0x6d 0x6c 0x78 0x30
    32: 0x2e 0x31 0x00 0x00
    36: 0x00 0x00 0x00 0x00
    40: 0x16 0x1d 0x07 0xd2
    44: 0x10 0x1d 0x15 0xb3
    48: 0x00 0x17 0x15 0xb3
    52: 0x00 0x00 0x81 0x19

This should be parsed as "1.1.0".

"f" in the upper-nibble means to ignore it, contributing zero.

If both nibbles are "f", I think the whole field is supposed to be ignored.
Major and minor are "required", meaning they're not supposed to be "ff",
but the update field is "optional" so I think it can be ff. I think the
simplest thing to do is just set the major and minor to zero instead of
juggling some conditional logic or something.

bcd2bin() from "include/linux/bcd.h" seems to assume both nibbles are 0-9,
so I've provided a custom BCD decoding function.

Alpha1 and alpha2 are ISO/IEC 8859-1 encoded, which just means ASCII
characters as far as I can tell, although the full encoding table for
non-alphabetic characters is slightly different (I think).

I imagine the alpha fields are just supposed to be alphabetic characters,
but I haven't seen any network cards actually report a non-zero value for
either.

If people wrote software against this netlink behavior, and were parsing
the major and minor versions themselves from the u32, then this would
definitely break their code.

[1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.0.0.pdf
[2] https://en.wikipedia.org/wiki/Binary-coded_decimal
[2] https://en.wikipedia.org/wiki/ISO/IEC_8859-1

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Fixes: 138635cc27c9 ("net/ncsi: NCSI response packet handler")
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit 3084b58bfd0b9e4b5e034f31f31b42977db35f12)
---
 net/ncsi/internal.h     |  7 +++++--
 net/ncsi/ncsi-netlink.c |  4 ++--
 net/ncsi/ncsi-pkt.h     |  7 +++++--
 net/ncsi/ncsi-rsp.c     | 26 ++++++++++++++++++++++++--
 4 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 03757e76bb6b..374412ed780b 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -105,8 +105,11 @@ enum {
 
 
 struct ncsi_channel_version {
-	u32 version;		/* Supported BCD encoded NCSI version */
-	u32 alpha2;		/* Supported BCD encoded NCSI version */
+	u8   major;		/* NCSI version major */
+	u8   minor;		/* NCSI version minor */
+	u8   update;		/* NCSI version update */
+	char alpha1;		/* NCSI version alpha1 */
+	char alpha2;		/* NCSI version alpha2 */
 	u8  fw_name[12];	/* Firmware name string                */
 	u32 fw_version;		/* Firmware version                   */
 	u16 pci_ids[4];		/* PCI identification                 */
diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
index d27f4eccce6d..fe681680b5d9 100644
--- a/net/ncsi/ncsi-netlink.c
+++ b/net/ncsi/ncsi-netlink.c
@@ -71,8 +71,8 @@ static int ncsi_write_channel_info(struct sk_buff *skb,
 	if (nc == nc->package->preferred_channel)
 		nla_put_flag(skb, NCSI_CHANNEL_ATTR_FORCED);
 
-	nla_put_u32(skb, NCSI_CHANNEL_ATTR_VERSION_MAJOR, nc->version.version);
-	nla_put_u32(skb, NCSI_CHANNEL_ATTR_VERSION_MINOR, nc->version.alpha2);
+	nla_put_u32(skb, NCSI_CHANNEL_ATTR_VERSION_MAJOR, nc->version.major);
+	nla_put_u32(skb, NCSI_CHANNEL_ATTR_VERSION_MINOR, nc->version.minor);
 	nla_put_string(skb, NCSI_CHANNEL_ATTR_VERSION_STR, nc->version.fw_name);
 
 	vid_nest = nla_nest_start_noflag(skb, NCSI_CHANNEL_ATTR_VLAN_LIST);
diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
index ba66c7dc3a21..c9d1da34dc4d 100644
--- a/net/ncsi/ncsi-pkt.h
+++ b/net/ncsi/ncsi-pkt.h
@@ -197,9 +197,12 @@ struct ncsi_rsp_gls_pkt {
 /* Get Version ID */
 struct ncsi_rsp_gvi_pkt {
 	struct ncsi_rsp_pkt_hdr rsp;          /* Response header */
-	__be32                  ncsi_version; /* NCSI version    */
+	unsigned char           major;        /* NCSI version major */
+	unsigned char           minor;        /* NCSI version minor */
+	unsigned char           update;       /* NCSI version update */
+	unsigned char           alpha1;       /* NCSI version alpha1 */
 	unsigned char           reserved[3];  /* Reserved        */
-	unsigned char           alpha2;       /* NCSI version    */
+	unsigned char           alpha2;       /* NCSI version alpha2 */
 	unsigned char           fw_name[12];  /* f/w name string */
 	__be32                  fw_version;   /* f/w version     */
 	__be16                  pci_ids[4];   /* PCI IDs         */
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 069c2659074b..480e80e3c283 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -19,6 +19,19 @@
 #include "ncsi-pkt.h"
 #include "ncsi-netlink.h"
 
+/* Nibbles within [0xA, 0xF] add zero "0" to the returned value.
+ * Optional fields (encoded as 0xFF) will default to zero.
+ */
+static u8 decode_bcd_u8(u8 x)
+{
+	int lo = x & 0xF;
+	int hi = x >> 4;
+
+	lo = lo < 0xA ? lo : 0;
+	hi = hi < 0xA ? hi : 0;
+	return lo + hi * 10;
+}
+
 static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
 				 unsigned short payload)
 {
@@ -755,9 +768,18 @@ static int ncsi_rsp_handler_gvi(struct ncsi_request *nr)
 	if (!nc)
 		return -ENODEV;
 
-	/* Update to channel's version info */
+	/* Update channel's version info
+	 *
+	 * Major, minor, and update fields are supposed to be
+	 * unsigned integers encoded as packed BCD.
+	 *
+	 * Alpha1 and alpha2 are ISO/IEC 8859-1 characters.
+	 */
 	ncv = &nc->version;
-	ncv->version = ntohl(rsp->ncsi_version);
+	ncv->major = decode_bcd_u8(rsp->major);
+	ncv->minor = decode_bcd_u8(rsp->minor);
+	ncv->update = decode_bcd_u8(rsp->update);
+	ncv->alpha1 = rsp->alpha1;
 	ncv->alpha2 = rsp->alpha2;
 	memcpy(ncv->fw_name, rsp->fw_name, 12);
 	ncv->fw_version = ntohl(rsp->fw_version);
-- 
2.41.0

