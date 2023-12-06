Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1184C807A4A
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 22:24:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DCkEstRP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Slr53402Fz3cTT
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 08:24:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DCkEstRP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Slr4R148Sz300f
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 08:23:49 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bf82f4409so1476674e87.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Dec 2023 13:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701897821; x=1702502621; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gyu1M2VnuE3xFmzU8FXfRgvPipumyc2+kitj+HC5Nx0=;
        b=DCkEstRPriuRdFbTB8zDJDsic+CqO2/2x+z6P6a0VoQadObuDgq4QUU1Ig4QdrVX4T
         qQFxd3cpSnTPUX59exl11O1BQeQkqS60Hhs8HX1VuMR5C3twYXMdUaQmfBZpRy/2lAW9
         btZAsHjz+HpwIpDjooeBkwyPeINPiI0fPiC8rRGb3HDWcZo3jxHYrsO8QyO8qRa7Y6SX
         qYWCi3ixT5sIZQYXdX5/CO/3QN4rGN/78gx2B0YoXf5l7A77A6pIOP86gqkn8LFs9X6o
         PZwD0DUMQ17hHXhVuH8m6UHphH5xTI0Vh5s5eY3WgihvYpWvR+K49d3wC5iibgsYnWik
         BkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701897821; x=1702502621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gyu1M2VnuE3xFmzU8FXfRgvPipumyc2+kitj+HC5Nx0=;
        b=wrZz0R9TVraRQO56y8c11vQJFMU6B6JYXKmus5LQ+rKQ3gNzQrpWmDUEdfp4HzqJa4
         KNm3kucN+/9C08ns6xGvyY7+LoI9UvOflmEXKglGajEETTpvq6e+LrYijxKtTAYLHytb
         JBdoEMBKOFoEbSvcLvugYFDnLy8LPBcgAFrpsXT0c8OeBOp0Fq/iPz8MatnhESnjLbJL
         dyaIGokn2Poqr9ooDqMo1wlGCclPke4qMO1S/v/30acjYDjqzxBApLC6LvSKkJQIXmqa
         KuXCJNIdozl+lIUaTcUOVkM7r/H6WMe1SfgXKKgpV4C5CkfPo1xQ8uwH+4xJlLCE32F0
         yviA==
X-Gm-Message-State: AOJu0YxXcrLiRR+bz9+jJoWJmUCoJRumHOlJwHLvqWSGwa30wNakjEJz
	lpGAsNy8/AjPDJJDe2xVrXdhP1COEkWEG2dw
X-Google-Smtp-Source: AGHT+IEVVdjUt0+jQ/s1V7YYDndkGc4uLh7HvJuu0dw0o1BjwwAxoAo8RwNvJE+niturdRbRp0LSNQ==
X-Received: by 2002:ac2:5de3:0:b0:50b:e472:d825 with SMTP id z3-20020ac25de3000000b0050be472d825mr2299928lfq.20.1701897820605;
        Wed, 06 Dec 2023 13:23:40 -0800 (PST)
Received: from [192.168.1.161] ([81.200.16.167])
        by smtp.gmail.com with ESMTPSA id m15-20020a0565120a8f00b0050bfda10057sm832465lfu.85.2023.12.06.13.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 13:23:39 -0800 (PST)
Message-ID: <6abc879a2c29cc8b8044c5c483bff5a01750695b.camel@gmail.com>
Subject: Re: [PATCH dev-5.6 3/3] net/ncsi: Add NC-SI 1.2 Get MC MAC Address
 command
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 07 Dec 2023 00:23:38 +0300
In-Reply-To: <20231205234843.4013767-3-patrick@stwcx.xyz>
References: <20231205234843.4013767-1-patrick@stwcx.xyz>
	 <20231205234843.4013767-3-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0 
MIME-Version: 1.0
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
Cc: Peter Delevoryas <peter@pjd.dev>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2023-12-05 at 17:48 -0600, Patrick Williams wrote:
> From: Peter Delevoryas <peter@pjd.dev>
>=20
> This change adds support for the NC-SI 1.2 Get MC MAC Address
> command,
> specified here:
>=20
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.2.=
0.pdf
>=20
> It serves the exact same function as the existing OEM Get MAC Address
> commands, so if a channel reports that it supports NC-SI 1.2, we
> prefer
> to use the standard command rather than the OEM command.
>=20
> Verified with an invalid MAC address and 2 valid ones:
>=20
> [=C2=A0=C2=A0 55.137072] ftgmac100 1e690000.ftgmac eth0: NCSI: Received 3
> provisioned MAC addresses
> [=C2=A0=C2=A0 55.137614] ftgmac100 1e690000.ftgmac eth0: NCSI: MAC addres=
s 0:
> 00:00:00:00:00:00
> [=C2=A0=C2=A0 55.138026] ftgmac100 1e690000.ftgmac eth0: NCSI: MAC addres=
s 1:
> fa:ce:b0:0c:20:22
> [=C2=A0=C2=A0 55.138528] ftgmac100 1e690000.ftgmac eth0: NCSI: MAC addres=
s 2:
> fa:ce:b0:0c:20:23
> [=C2=A0=C2=A0 55.139241] ftgmac100 1e690000.ftgmac eth0: NCSI: Unable to =
assign
> 00:00:00:00:00:00 to device
> [=C2=A0=C2=A0 55.140098] ftgmac100 1e690000.ftgmac eth0: NCSI: Set MAC ad=
dress
> to fa:ce:b0:0c:20:22
>=20
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> (cherry picked from commit b8291cf3d1180b5b61299922f17c9441616a805a)
> ---
> =C2=A0net/ncsi/ncsi-cmd.c=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0net/ncsi/ncsi-manage.c |=C2=A0 9 +++++++--
> =C2=A0net/ncsi/ncsi-pkt.h=C2=A0=C2=A0=C2=A0 | 10 ++++++++++
> =C2=A0net/ncsi/ncsi-rsp.c=C2=A0=C2=A0=C2=A0 | 41
> ++++++++++++++++++++++++++++++++++++++++-
> =C2=A04 files changed, 59 insertions(+), 4 deletions(-)
>=20
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index fd2236ee9a79..b3ff37a181d7 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -270,7 +270,8 @@ static struct ncsi_cmd_handler {
> =C2=A0	{ NCSI_PKT_CMD_GPS,=C2=A0=C2=A0=C2=A0 0, ncsi_cmd_handler_default =
},
> =C2=A0	{ NCSI_PKT_CMD_OEM,=C2=A0=C2=A0 -1, ncsi_cmd_handler_oem=C2=A0=C2=
=A0=C2=A0=C2=A0 },
> =C2=A0	{ NCSI_PKT_CMD_PLDM,=C2=A0=C2=A0 0, NULL=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 },
> -	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default }
> +	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default },
> +	{ NCSI_PKT_CMD_GMCMA,=C2=A0 0, ncsi_cmd_handler_default }
> =C2=A0};
> =C2=A0
> =C2=A0static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg
> *nca)
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index f3d7fe86fea1..745c788f1d1d 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -1038,11 +1038,16 @@ static void ncsi_configure_channel(struct
> ncsi_dev_priv *ndp)
> =C2=A0	case ncsi_dev_state_config_oem_gma:
> =C2=A0		nd->state =3D ncsi_dev_state_config_clear_vids;
> =C2=A0
> -		nca.type =3D NCSI_PKT_CMD_OEM;
> =C2=A0		nca.package =3D np->id;
> =C2=A0		nca.channel =3D nc->id;
> =C2=A0		ndp->pending_req_num =3D 1;
> -		ret =3D ncsi_gma_handler(&nca, nc->version.mf_id);
> +		if (nc->version.major >=3D 1 && nc->version.minor >=3D
> 2) {
> +			nca.type =3D NCSI_PKT_CMD_GMCMA;
> +			ret =3D ncsi_xmit_cmd(&nca);
> +		} else {
> +			nca.type =3D NCSI_PKT_CMD_OEM;
> +			ret =3D ncsi_gma_handler(&nca, nc-
> >version.mf_id);
> +		}
> =C2=A0		if (ret < 0)
> =C2=A0			schedule_work(&ndp->work);
> =C2=A0
> diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
> index c9d1da34dc4d..f2f3b5c1b941 100644
> --- a/net/ncsi/ncsi-pkt.h
> +++ b/net/ncsi/ncsi-pkt.h
> @@ -338,6 +338,14 @@ struct ncsi_rsp_gpuuid_pkt {
> =C2=A0	__be32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 checksum;
> =C2=A0};
> =C2=A0
> +/* Get MC MAC Address */
> +struct ncsi_rsp_gmcma_pkt {
> +	struct ncsi_rsp_pkt_hdr rsp;
> +	unsigned char=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 address_count;
> +	unsigned char=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reserved[3];
> +	unsigned char=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 addresses[][ETH_ALEN];
> +};
> +
> =C2=A0/* AEN: Link State Change */
> =C2=A0struct ncsi_aen_lsc_pkt {
> =C2=A0	struct ncsi_aen_pkt_hdr aen;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* AEN header=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> @@ -398,6 +406,7 @@ struct ncsi_aen_hncdsc_pkt {
> =C2=A0#define NCSI_PKT_CMD_GPUUID	0x52 /* Get package
> UUID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0#define NCSI_PKT_CMD_QPNPR	0x56 /* Query Pending NC PLDM
> request */
> =C2=A0#define NCSI_PKT_CMD_SNPR	0x57 /* Send NC PLDM Reply=C2=A0 */
> +#define NCSI_PKT_CMD_GMCMA	0x58 /* Get MC MAC Address */
> =C2=A0
> =C2=A0
> =C2=A0/* NCSI packet responses */
> @@ -433,6 +442,7 @@ struct ncsi_aen_hncdsc_pkt {
> =C2=A0#define NCSI_PKT_RSP_GPUUID	(NCSI_PKT_CMD_GPUUID + 0x80)
> =C2=A0#define NCSI_PKT_RSP_QPNPR	(NCSI_PKT_CMD_QPNPR=C2=A0=C2=A0 + 0x80)
> =C2=A0#define NCSI_PKT_RSP_SNPR	(NCSI_PKT_CMD_SNPR=C2=A0=C2=A0 + 0x80)
> +#define NCSI_PKT_RSP_GMCMA	(NCSI_PKT_CMD_GMCMA=C2=A0 + 0x80)
> =C2=A0
> =C2=A0/* NCSI response code/reason */
> =C2=A0#define NCSI_PKT_RSP_C_COMPLETED	0x0000 /* Command
> Completed=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 480e80e3c283..bee290d0f48b 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -1091,6 +1091,44 @@ static int ncsi_rsp_handler_netlink(struct
> ncsi_request *nr)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static int ncsi_rsp_handler_gmcma(struct ncsi_request *nr)
> +{
> +	struct ncsi_dev_priv *ndp =3D nr->ndp;
> +	struct net_device *ndev =3D ndp->ndev.dev;
> +	struct ncsi_rsp_gmcma_pkt *rsp;
> +	struct sockaddr saddr;
> +	int ret =3D -1;
> +	int i;
> +
> +	rsp =3D (struct ncsi_rsp_gmcma_pkt *)skb_network_header(nr-
> >rsp);
> +	saddr.sa_family =3D ndev->type;
> +	ndev->priv_flags |=3D IFF_LIVE_ADDR_CHANGE;
> +
> +	netdev_info(ndev, "NCSI: Received %d provisioned MAC
> addresses\n",
> +		=C2=A0=C2=A0=C2=A0 rsp->address_count);
> +	for (i =3D 0; i < rsp->address_count; i++) {
> +		netdev_info(ndev, "NCSI: MAC address %d:
> %02x:%02x:%02x:%02x:%02x:%02x\n",
> +			=C2=A0=C2=A0=C2=A0 i, rsp->addresses[i][0], rsp-
> >addresses[i][1],
> +			=C2=A0=C2=A0=C2=A0 rsp->addresses[i][2], rsp-
> >addresses[i][3],
> +			=C2=A0=C2=A0=C2=A0 rsp->addresses[i][4], rsp-
> >addresses[i][5]);
> +	}
> +
> +	for (i =3D 0; i < rsp->address_count; i++) {
> +		memcpy(saddr.sa_data, &rsp->addresses[i], ETH_ALEN);
> +		ret =3D ndev->netdev_ops->ndo_set_mac_address(ndev,
> &saddr);
> +		if (ret < 0) {
> +			netdev_warn(ndev, "NCSI: Unable to assign
> %pM to device\n",
> +				=C2=A0=C2=A0=C2=A0 saddr.sa_data);
> +			continue;
> +		}
> +		netdev_warn(ndev, "NCSI: Set MAC address to %pM\n",
> saddr.sa_data);
> +		break;
> +	}
> +
> +	ndp->gma_flag =3D ret =3D=3D 0;
> +	return ret;
> +}
> +
> =C2=A0static struct ncsi_rsp_handler {
> =C2=A0	unsigned char	type;
> =C2=A0	int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 payload;
> @@ -1127,7 +1165,8 @@ static struct ncsi_rsp_handler {
> =C2=A0	{ NCSI_PKT_RSP_PLDM,=C2=A0=C2=A0 -1, ncsi_rsp_handler_pldm=C2=A0=
=C2=A0=C2=A0 },
> =C2=A0	{ NCSI_PKT_RSP_GPUUID, 20, ncsi_rsp_handler_gpuuid=C2=A0 },
> =C2=A0	{ NCSI_PKT_RSP_QPNPR,=C2=A0 -1, ncsi_rsp_handler_pldm=C2=A0=C2=A0=
=C2=A0 },
> -	{ NCSI_PKT_RSP_SNPR,=C2=A0=C2=A0 -1, ncsi_rsp_handler_pldm=C2=A0=C2=A0=
=C2=A0 }
> +	{ NCSI_PKT_RSP_SNPR,=C2=A0=C2=A0 -1, ncsi_rsp_handler_pldm=C2=A0=C2=A0=
=C2=A0 },
> +	{ NCSI_PKT_RSP_GMCMA,=C2=A0 -1, ncsi_rsp_handler_gmcma=C2=A0=C2=A0 },
> =C2=A0};
> =C2=A0
> =C2=A0int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,


Patrick, I've the fix about ndo_set_mac_address not so long in the past
https://lore.kernel.org/all/20230828101151.684010399@linuxfoundation.org/

ndo_set_mac_address do not notify network layer about mac change.

Thanks.
