Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD546A186C
	for <lists+openbmc@lfdr.de>; Fri, 24 Feb 2023 10:02:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNP5z3FKBz3f4C
	for <lists+openbmc@lfdr.de>; Fri, 24 Feb 2023 20:01:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=B/n9BHda;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=74.6.131.123; helo=sonic311-13.consmr.mail.bf2.yahoo.com; envelope-from=erhan14@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=B/n9BHda;
	dkim-atps=neutral
Received: from sonic311-13.consmr.mail.bf2.yahoo.com (sonic311-13.consmr.mail.bf2.yahoo.com [74.6.131.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNP5J6MPWz3cLC
	for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2023 20:01:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1677229279; bh=cp0CiPJq6MgYEZrAK4KWHlfa6og9qSH7pGxUC0pLtKk=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=B/n9BHda67YoSoPvE5K0x/f2gFW2x9wzbt1cZBPiLAKX+KiDJiNLDNK4eosMYqpwtY9tucAzy5+sQWbLahtSdZi38+/A3IqQKKK8ySdkPbXKi2Oj+3yXLdGNPCUOh6A3vEjpfD0hCbrt1lusjteYgsSAc8Vy0WEbbeZjkp5OMJIGoRuWYsITMvXjIH0R8BdEcwcTB1YBmZFm9qweLUJUKsEtr+IJU7CQ7OqMhyjYxeVEiDQxrWgNE/SYXkjjOiP9WyOCu+iRMftwALUTfP9x259/Fnv8haeX+1KuElHKmw28GbAcBVPdcmbnMf6SnLkwMlm/pp6PTwuvnnSYhTBCRA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1677229279; bh=Xq0NHdoqqmo4oTdr5lpNn22mGsENFaNIH8RIeNSTL1D=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=jduXkSKDuzByp3dCzL+UqQeuc0ZYwaZn3iP3wq/waTBrLjDrEuQWs4NgVTE47VBTD3TA3iuIIoLNXVkDB6dl0wFRtbhdThML+CeK5AWGy6hEWuh3JJf/Rca3K2ATFN/5Bm71pO6qrRUnbtFPX8Cw4XpDb8XMbQX1yH/wmeZl5+UNejPA515NITvD3uyBJ2IKXu4ycQHNI8nZ1HwxrgfbzhgNfFe4+Cetu5dpXRfUFkzu7Hzm02p8tJ/TQAKiAXFZqUELLxDZEVEawRXvJzRjnuvNnwD6Znr2d9QzYAXotxN4mMTtX4MIZgPn6ZrH/1Yq0B3jI8pEwFPiYvWKVMtytQ==
X-YMail-OSG: gzdkcHUVM1m6WYwmdbMl3vWKLxWZzvDQtPqMbwsbGyu2yAGXDI1trlM5FspWt_.
 JLOazbmv_8iVTfo6i9hMHHJMJQh4srRx5THwnNVhxrZYyxMj2FY8zHhWnINjzNfFfqWHKbWNxBVv
 P1ChWKha8ppjgFBhWtdM6iZLBd569.4IX7fdccMUEDPL4XuB5rpTbf6DBtQvjhlwI8sDPKxq8OJB
 7fNH12J9DyrICefdqyJIPpXws8JoLF0zlhZfUMc_Vxi2F_CaLecfbto6QRF22xQh7YgrARa62Qun
 wbSsV4vWiivFFKMgcZEsdSqnnxNJjav1MKHM8btwWd3sqPufN03_Y5o1noo9JgGD8ClU7FVSRPlT
 BZHn7SgFZe3BewqkAe6AUlGVWvSDe491iazwU4_r82j8urdSJziufuatTL2BfMBe4I288PK.sOLj
 QrPwezqplBzlGDdAp8OsowH51SmBNU.dipPvMlpCgnXfJnuLo7YX3xtDFwWGQLEJkl06RH7_Zqk0
 rw0H1dHwdN_CC4k84E.Xx.E_1GuGkASIjyJIMyx.84mGdqXEKKsskoytzaV7WspBlvwrLRt5HH3y
 WOaLhSE7yBnjVbP.X1ZuIpN1uDDYvMtdZL40wIK99Ub_OWGHcPjgfO6Z.fNHjg29b.YqYnCY.8Cm
 q34bbYwsBbnGaWHkVMeOF1nWj68jXDdTswHJLAH6p8ZQhfEucXjLYzy.VoIta9f2AzgERYu4s2tz
 NHdIazJjHvnQrA0wGB1NWH3G7TLsYT_mdHjN04NUgTF2wlnKyfp6QGGDscMRhdKzftxJvGg55ob0
 hL0DiqGos7zchyzwYyuej8S2PwiroZGduf4e2f.Tskgxrk1q4VGKqD5sp6RVjSwUYzdQ2eagRw8P
 yf2ZIjM4otl2YuGhHTzslZgB..26Gsii8zfM5cDZRSz8fen7zEsexyntynu4vCV0_ggRzX80OUv0
 V_tmO5QKXnGPo6b4gEs8mcNU2qTiRX06gv6nkrk4zMPRqnfcbfOCwvNEh2aUdond6NvlEYor329f
 e31LSjMzTu.Z6TL6lJ9jucOVHj2WTzhPrl55w6RWQeI0Po5y6hu_QPHCs3w3zifANpza5sPz9AOE
 G3iGZFhbsbSxRUzIn3qA7ridKI1y7nXRp_VTXGLfJ9J07y7XmXi7JV3mKhNuacJsVv02l7VguGE.
 IBmM9orVrbFMwGswZ6UbXB7eNXBgghXvj2z_F_7ApX3bjOzwTaG8h2J3gQzcr67gfx7QllZBDbS1
 KwQ23D5vvqkMfHNfdt2EJTvQb.qO3aN0yL7QA.2TGRNDFOHLF84ilqNp_7hsy0W3GIOswneIX2Sl
 M.lPXUckbQ8P.B1kP3hlhAq0CqTOLDfqBVMN6Cutun4W5a.zN.fpFF_0o.6sTi_QmbP9cR0UgZDG
 KbONuF7kwAGMtf53e610D8uTXA3gf6MEAfmwcPlQWL.hKz707tcQpgwMBJx4wJuD9a4BBQi9MXra
 oL5ZN9sXWeH_UX3sOQj4eQGaCk0hYw.bwzTN44r4uf2Gl7b.H22bbMj0VWYlKvlrNVhWMMLZNKVl
 rVVgf300lTLcVYgxQ8eqoXYyil79pOoLhZRTArOoHYUCCm1ulxvKiSfU_dxtKZKy4vxvaN1prtbM
 ebWzptdufhxpC.tfGUEd9uFNExXrckRU.nF6.DggRT5uAT9Uy3MVDDfPrqBR7ZubQ5T5HN6EpK5y
 ZzJ09glLgYfTowWSTnwS18btIEKMXEhQpfs1aAYOvOMESwyPMtdLE_rNYX_WG7pJXfI0MJlI95Gl
 hh8k9n5ZvtpN_VYcesuQ294w89y_EmJnTZ2XkI31uISG2GfLymid4jkwogqpGr6bRFeU9kisRgHN
 hYn.nexI__ZHDaxIwiX1dlt0ikg7ZohwuwZOo2f37.MaSgic9Oq6CMDijq59JrYI69DgQ1lsX5oS
 KZ8np6kPgdmYtTttXCIDmO8wPX5bQWmPSLqMGZkPgm5VhRzTeildV.O8ysYeMN88JXamIm7deWqz
 SjZ3o.oHSl9z9JNU.Al3Ec2Q6LWlNsorgbT8OPY9NTRpfZsND6isIbhtQdY7vEVUgQXAQLvLLwxs
 GwBOOeWngRWdYh.W9S4SAurmycud6U0rxTSlnIDZgIE4g9NBjVxuFzTTKiO8pbtnA1f1nyb8DvGn
 tjx4w1X0BW_3cJrO.EccGoRoH9TKAeG8LWFqYHNWRmarSricziYIOJhW51WaKhL9iQrtGfOLz.RM
 pgW0ob1M.94zEDV5e3kQAa4upY1vB4qA5RUitoEMI1_D_6aVXjya2
X-Sonic-MF: <erhan14@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.bf2.yahoo.com with HTTP; Fri, 24 Feb 2023 09:01:19 +0000
Date: Fri, 24 Feb 2023 09:01:18 +0000 (UTC)
From: "Erhan Y." <erhan14@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"rentao.bupt@gmail.com" <rentao.bupt@gmail.com>
Message-ID: <41828313.192702.1677229278186@mail.yahoo.com>
In-Reply-To: <mailman.2946.1677197072.1397.openbmc@lists.ozlabs.org>
References: <mailman.2946.1677197072.1397.openbmc@lists.ozlabs.org>
Subject: Re: openbmc Digest, Vol 90, Issue 49
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_192701_1690754858.1677229278178"
X-Mailer: WebService/1.1.21221 YMailNorrin
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

------=_Part_192701_1690754858.1677229278178
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Hi Tao,Where can we find the current source or patches for AST2xxx=C2=A0JT=
AG master drivers on Linux 6.x?Thanks

Message: 1
Date: Wed, 22 Feb 2023 23:33:29 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Linux 6.1
Message-ID: <Y/cWyUVGkYA2UvBp@fedora>
Content-Type: text/plain; charset=3Dus-ascii

On Wed, Feb 22, 2023 at 06:25:13AM +0000, Joel Stanley wrote:
> On Wed, 22 Feb 2023 at 06:11, Tao Ren <rentao.bupt@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > Thanks for the update. Let me move some Meta/Facebook AST2500 and
> > AST2600 Network OpenBMCs to v6.1, and will share my findings later.
>
> Thanks Tao, I appreciate it.

Just heads up I sanity tested dev-6.1 branch on 3 aspeed generations,
and everything looks normal. The 3 openbmc platforms are:
=C2=A0 - wedge100 (AST2400)
=C2=A0 - cmm (AST2500)
=C2=A0 - fbdarwin (AST2600, dts to be upstreamed)

>
> > Besides, could you please share your long term kernel upgrade plan? For
> > example, are you planning to align with LTS kernel in the future? Or th=
e
> > ultimate goal is to upgrade openbmc kernel whenever newer kernel is
> > released?
>
> Somewhere in between those two.
>
> If we were to wait 5 or so years between updates, then we remove the
> motivation for developers to upstream their code, and I imagine it
> would be a headache to hunt down regressions when making that big
> jump.
>
> On the other hand, management has been trained to target the stable
> releases and somehow consider them to be better than others. I argue
> this isn't true, because the code is only as stable as the test and
> development resources that are put into it! That said, it's less work
> to merge in the stable tree every week or two and test that than it is
> to do a new rebase every three months.
>
> The ultimate goal is to have all of our code upstream, and just use
> whatever kernel yocto has. We're pretty close for aspeed machines; at
> IBM we have some downstream hacks for misbehaving i2c devices, and
> some device trees for pre-production hardware that have minor
> differences to the production version. If we were to upstream the
> hacks for i2c devices (or stop using them) then we could ship upstream
> kernels.
>
> Ultimately it would be best for the project if we used the latest
> kernel on master, and had a LTS kernel that was used by product
> branches. This would require the project to fund someone to do this
> work long term, to ensure the stable updates haven't caused
> regressions, to cherry pick patches that fix code that was not present
> in the upstream release, and in their remaining time help get more
> code in mainline.
>
> Cheers,
>
> Joel

Thanks for sharing the details, and in short, I'm moving torward the
similar direction:)

My current plan is to upgrade openbmc kernel at least once a year
(skipping ~4 kernel releases) for facebook network openbmc platforms,
and I'm facing the similar challenges: upstreaming kernel patches and
test enhancement. I don't have plan to force more frequent kernel
upgrade in 2023, because if I had bandwidth, I'd rather spend the time
upstreaming patches: I believe kernel upgrade would be much easier if
all the patches are upstreamed.

I quickly went through the local kernel patches in my repo, and they
fall in 3 major categories: 1) JTAG master drivers 2) hwmon drivers 3)
enabling dsa in a few dts files. I'm not sure if anyone is actively
looking into the jtag patch series, but I will try my best to clean up
some patches in #2 and #3 this year.

BTW, I will create the recipe to fetch dev-6.1 into meta/facebook
openbmc tree soon. Thanks again for maintaining the tree.


Cheers,

Tao
    On Friday, February 24, 2023 at 03:08:44 AM GMT+3, openbmc-request@list=
s.ozlabs.org <openbmc-request@lists.ozlabs.org> wrote: =20
=20
 Send openbmc mailing list submissions to
=C2=A0=C2=A0=C2=A0 openbmc@lists.ozlabs.org

To subscribe or unsubscribe via the World Wide Web, visit
=C2=A0=C2=A0=C2=A0 https://lists.ozlabs.org/listinfo/openbmc
or, via email, send a message with subject or body 'help' to
=C2=A0=C2=A0=C2=A0 openbmc-request@lists.ozlabs.org

You can reach the person managing the list at
=C2=A0=C2=A0=C2=A0 openbmc-owner@lists.ozlabs.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of openbmc digest..."


Today's Topics:

=C2=A0 1. Re: OpenBMC Linux 6.1 (Tao Ren)
=C2=A0 2. RE: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED
=C2=A0 =C2=A0 =C2=A0 i2Cv2 (Ryan Chen)
=C2=A0 3. [PATCH v2 0/3] ARM: dts: aspeed: ASRock BMC updates (Zev Weiss)
=C2=A0 4. [PATCH v2 3/3] ARM: dts: aspeed: asrock: Correct firmware
=C2=A0 =C2=A0 =C2=A0 flash SPI clocks (Zev Weiss)


----------------------------------------------------------------------

Message: 1
Date: Wed, 22 Feb 2023 23:33:29 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Linux 6.1
Message-ID: <Y/cWyUVGkYA2UvBp@fedora>
Content-Type: text/plain; charset=3Dus-ascii

On Wed, Feb 22, 2023 at 06:25:13AM +0000, Joel Stanley wrote:
> On Wed, 22 Feb 2023 at 06:11, Tao Ren <rentao.bupt@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > Thanks for the update. Let me move some Meta/Facebook AST2500 and
> > AST2600 Network OpenBMCs to v6.1, and will share my findings later.
>=20
> Thanks Tao, I appreciate it.

Just heads up I sanity tested dev-6.1 branch on 3 aspeed generations,
and everything looks normal. The 3 openbmc platforms are:
=C2=A0 - wedge100 (AST2400)
=C2=A0 - cmm (AST2500)
=C2=A0 - fbdarwin (AST2600, dts to be upstreamed)

>=20
> > Besides, could you please share your long term kernel upgrade plan? For
> > example, are you planning to align with LTS kernel in the future? Or th=
e
> > ultimate goal is to upgrade openbmc kernel whenever newer kernel is
> > released?
>=20
> Somewhere in between those two.
>=20
> If we were to wait 5 or so years between updates, then we remove the
> motivation for developers to upstream their code, and I imagine it
> would be a headache to hunt down regressions when making that big
> jump.
>=20
> On the other hand, management has been trained to target the stable
> releases and somehow consider them to be better than others. I argue
> this isn't true, because the code is only as stable as the test and
> development resources that are put into it! That said, it's less work
> to merge in the stable tree every week or two and test that than it is
> to do a new rebase every three months.
>=20
> The ultimate goal is to have all of our code upstream, and just use
> whatever kernel yocto has. We're pretty close for aspeed machines; at
> IBM we have some downstream hacks for misbehaving i2c devices, and
> some device trees for pre-production hardware that have minor
> differences to the production version. If we were to upstream the
> hacks for i2c devices (or stop using them) then we could ship upstream
> kernels.
>=20
> Ultimately it would be best for the project if we used the latest
> kernel on master, and had a LTS kernel that was used by product
> branches. This would require the project to fund someone to do this
> work long term, to ensure the stable updates haven't caused
> regressions, to cherry pick patches that fix code that was not present
> in the upstream release, and in their remaining time help get more
> code in mainline.
>=20
> Cheers,
>=20
> Joel

Thanks for sharing the details, and in short, I'm moving torward the
similar direction:)

My current plan is to upgrade openbmc kernel at least once a year
(skipping ~4 kernel releases) for facebook network openbmc platforms,
and I'm facing the similar challenges: upstreaming kernel patches and
test enhancement. I don't have plan to force more frequent kernel
upgrade in 2023, because if I had bandwidth, I'd rather spend the time
upstreaming patches: I believe kernel upgrade would be much easier if
all the patches are upstreamed.

I quickly went through the local kernel patches in my repo, and they
fall in 3 major categories: 1) JTAG master drivers 2) hwmon drivers 3)
enabling dsa in a few dts files. I'm not sure if anyone is actively
looking into the jtag patch series, but I will try my best to clean up
some patches in #2 and #3 this year.

BTW, I will create the recipe to fetch dev-6.1 into meta/facebook
openbmc tree soon. Thanks again for maintaining the tree.


Cheers,

Tao


------------------------------

Message: 2
Date: Thu, 23 Feb 2023 10:25:56 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
=C2=A0=C2=A0=C2=A0 <robh+dt@kernel.org>, Krzysztof Kozlowski
=C2=A0=C2=A0=C2=A0 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@=
jms.id.au>,
=C2=A0=C2=A0=C2=A0 Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel
=C2=A0=C2=A0=C2=A0 <p.zabel@pengutronix.de>,=C2=A0=C2=A0=C2=A0 "openbmc@lis=
ts.ozlabs.org"
=C2=A0=C2=A0=C2=A0 <openbmc@lists.ozlabs.org>,=C2=A0=C2=A0=C2=A0 "linux-arm=
-kernel@lists.infradead.org"
=C2=A0=C2=A0=C2=A0 <linux-arm-kernel@lists.infradead.org>,
=C2=A0=C2=A0=C2=A0 "linux-aspeed@lists.ozlabs.org"=C2=A0=C2=A0=C2=A0 <linux=
-aspeed@lists.ozlabs.org>,
=C2=A0=C2=A0=C2=A0 "linux-kernel@vger.kernel.org"=C2=A0=C2=A0=C2=A0 <linux-=
kernel@vger.kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED
=C2=A0=C2=A0=C2=A0 i2Cv2
Message-ID:
=C2=A0=C2=A0=C2=A0 <SEZPR06MB52697747528490B1A16AF87FF2AB9@SEZPR06MB5269.ap=
cprd06.prod.outlook.com>
=C2=A0=C2=A0=C2=A0=20
Content-Type: text/plain; charset=3D"utf-8"

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Thursday, February 23, 2023 5:29 PM
> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andre=
w
> Jeffery <andrew@aj.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv=
2
>=20
> On 22/02/2023 11:47, Ryan Chen wrote:
> >>>> connector. That slave will keep state to drive clock stretching.
> >>>>> So it is specific enable in i2c bus#1. Others is not needed enable
> timeout.
> >>>>> Does this draw is more clear in scenario?
> >>>>
> >>>> I2C bus #1 works in slave mode? So you always need it for slave work=
?
> >>>
> >>> Yes, it is both slave/master mode. It is always dual role. Slave
> >>> must always
> >> work.
> >>> Due to another board master will send.
> >>
> >> I meant that you need this property when it works in slave mode? It
> >> would be then redundant to have in DT as it is implied by the mode.
> >
> > But timeout feature is also apply in master. It for avoid suddenly
> > slave miss(un-plug) Master can timeout and release the SDA/SCL, return.
>=20
> OK, yet the property should describe the hardware, not the register featu=
re you
> want to program. You need to properly model it in DT binding to represent
> hardware setup, not your desired Linux driver behavior.
>=20
> >>>>> The same draw, in this case, i2c bus#1 that is multi-master
> >>>>> transfer
> >>>> architecture.
> >>>>> Both will inactive with trunk data. That cane enable i2c#1 use DMA
> >>>>> transfer
> >>>> to reduce CPU utilized.
> >>>>> Others (bus#2/3) can keep byte/buff mode.
> >>>>
> >>>> Isn't then current bus configuration for I2C#1 known to the driver?
> >>>> Jeremy asked few other questions around here...
> >>>
> >>> No, The driver don't know currently board configuration.
> >>
> >> It knows whether it is working in multi-master/slave mode.
> >
> > But in DT can decide which i2c bus number can use dma or buffer mode
> transfer.
> > If in another i2c bus support master only, also can use dma to transfer=
 trunk
> data to another slave.
>=20
> and none of these were explained in commit msg or device description.
>=20
Thanks your guidance. I will add all those discussion in next patches cover=
-letter.
Best regards,
Ryan Chen.

------------------------------

Message: 3
Date: Thu, 23 Feb 2023 16:03:57 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>,=C2=A0=C2=A0=C2=A0 Joel Stanley <joel@=
jms.id.au>
Cc: Zev Weiss <zev@bewilderbeest.net>,=C2=A0=C2=A0=C2=A0 openbmc@lists.ozla=
bs.org,
=C2=A0=C2=A0=C2=A0 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,=
=C2=A0=C2=A0=C2=A0 Rob Herring
=C2=A0=C2=A0=C2=A0 <robh+dt@kernel.org>,=C2=A0=C2=A0=C2=A0 devicetree@vger.=
kernel.org,
=C2=A0=C2=A0=C2=A0 linux-arm-kernel@lists.infradead.org,=C2=A0=C2=A0=C2=A0 =
linux-aspeed@lists.ozlabs.org,
=C2=A0=C2=A0=C2=A0 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ARM: dts: aspeed: ASRock BMC updates
Message-ID: <20230224000400.12226-1-zev@bewilderbeest.net>

Hello,

This patch series contains a few small device-tree updates for ASRock
BMCs: an LED polarity fix for romed8hm3, enabling the ast2500 PECI
device on e3c246d4i, and a SPI flash clock frequency fix for both.

Thanks,
Zev

Changes since v1 [0]:
 - Added patch 3 correcting SPI flash clocks

[0] https://lore.kernel.org/linux-devicetree/20230203105405.21942-1-zev@bew=
ilderbeest.net/

Zev Weiss (3):
=C2=A0 ARM: dts: aspeed: romed8hm3: Fix GPIO polarity of system-fault LED
=C2=A0 ARM: dts: aspeed: e3c246d4i: Add PECI device
=C2=A0 ARM: dts: aspeed: asrock: Correct firmware flash SPI clocks

 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 6 +++++-
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

--=20
2.39.1.438.gdcb075ea9396.dirty



------------------------------

Message: 4
Date: Thu, 23 Feb 2023 16:04:00 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>,=C2=A0=C2=A0=C2=A0 Joel Stanley <joel@=
jms.id.au>
Cc: Zev Weiss <zev@bewilderbeest.net>,=C2=A0=C2=A0=C2=A0 Krzysztof Kozlowsk=
i
=C2=A0=C2=A0=C2=A0 <krzysztof.kozlowski+dt@linaro.org>,=C2=A0=C2=A0=C2=A0 R=
ob Herring <robh+dt@kernel.org>,
=C2=A0=C2=A0=C2=A0 devicetree@vger.kernel.org,=C2=A0=C2=A0=C2=A0 linux-arm-=
kernel@lists.infradead.org,
=C2=A0=C2=A0=C2=A0 linux-aspeed@lists.ozlabs.org,=C2=A0=C2=A0=C2=A0 linux-k=
ernel@vger.kernel.org,
=C2=A0=C2=A0=C2=A0 openbmc@lists.ozlabs.org,=C2=A0=C2=A0=C2=A0 stable@vger.=
kernel.org
Subject: [PATCH v2 3/3] ARM: dts: aspeed: asrock: Correct firmware
=C2=A0=C2=A0=C2=A0 flash SPI clocks
Message-ID: <20230224000400.12226-4-zev@bewilderbeest.net>

While I'm not aware of any problems that have occurred running these
at 100 MHz, the official word from ASRock is that 50 MHz is the
correct speed to use, so let's be safe and use that instead.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Cc: stable@vger.kernel.org
Fixes: 2b81613ce417 ("ARM: dts: aspeed: Add ASRock E3C246D4I BMC")
Fixes: a9a3d60b937a ("ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC")
---
 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/b=
oot/dts/aspeed-bmc-asrock-e3c246d4i.dts
index 67a75aeafc2b..c4b2efbfdf56 100644
--- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
@@ -63,7 +63,7 @@ flash@0 {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 status =3D "okay";
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 m25p,fast-read;
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 label =3D "bmc";
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 spi-max-frequency =3D <100000000>; /=
* 100 MHz */
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 spi-max-frequency =3D <50000000>; /*=
 50 MHz */
 #include "openbmc-flash-layout.dtsi"
 =C2=A0=C2=A0=C2=A0 };
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/b=
oot/dts/aspeed-bmc-asrock-romed8hm3.dts
index 00efe1a93a69..4554abf0c7cd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
@@ -51,7 +51,7 @@ flash@0 {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 status =3D "okay";
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 m25p,fast-read;
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 label =3D "bmc";
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 spi-max-frequency =3D <100000000>; /=
* 100 MHz */
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 spi-max-frequency =3D <50000000>; /*=
 50 MHz */
 #include "openbmc-flash-layout-64.dtsi"
 =C2=A0=C2=A0=C2=A0 };
 };
--=20
2.39.1.438.gdcb075ea9396.dirty



End of openbmc Digest, Vol 90, Issue 49
***************************************
 =20
------=_Part_192701_1690754858.1677229278178
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp718ead1eyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false">Hi Tao,</div><div dir=3D"ltr=
" data-setdir=3D"false">Where can we find the current source or patches for=
 AST2xxx&nbsp;<span><span style=3D"color: rgb(0, 0, 0); font-family: Helvet=
ica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">JTAG master drive=
rs on Linux 6.x?</span></span></div><div dir=3D"ltr" data-setdir=3D"false">=
Thanks</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div><br></div=
><div dir=3D"ltr" data-setdir=3D"false"><div><div dir=3D"ltr" style=3D"font=
-family: Helvetica Neue, Helvetica, Arial, sans-serif;">Message: 1<br></div=
><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, s=
ans-serif;">Date: Wed, 22 Feb 2023 23:33:29 -0800<br></div><div dir=3D"ltr"=
 style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">From:=
 Tao Ren &lt;<a href=3D"mailto:rentao.bupt@gmail.com" style=3D"color: rgb(2=
5, 106, 212); text-decoration-line: underline;" rel=3D"nofollow" target=3D"=
_blank">rentao.bupt@gmail.com</a>&gt;<br></div><div dir=3D"ltr" style=3D"fo=
nt-family: Helvetica Neue, Helvetica, Arial, sans-serif;">To: Joel Stanley =
&lt;<a href=3D"mailto:joel@jms.id.au" style=3D"color: rgb(25, 106, 212); te=
xt-decoration-line: underline;" rel=3D"nofollow" target=3D"_blank">joel@jms=
.id.au</a>&gt;<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif;">Cc: OpenBMC Maillist &lt;<a href=3D"mail=
to:openbmc@lists.ozlabs.org" style=3D"color: rgb(25, 106, 212); text-decora=
tion-line: underline;" rel=3D"nofollow" target=3D"_blank">openbmc@lists.ozl=
abs.org</a>&gt;<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica N=
eue, Helvetica, Arial, sans-serif;">Subject: Re: OpenBMC Linux 6.1<br></div=
><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, s=
ans-serif;">Message-ID: &lt;Y/<a href=3D"mailto:cWyUVGkYA2UvBp@fedora" styl=
e=3D"color: rgb(25, 106, 212); text-decoration-line: underline;" rel=3D"nof=
ollow" target=3D"_blank">cWyUVGkYA2UvBp@fedora</a>&gt;<br></div><div dir=3D=
"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">=
Content-Type: text/plain; charset=3Dus-ascii<br></div><div dir=3D"ltr" styl=
e=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;"><br></div>=
<div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sa=
ns-serif;">On Wed, Feb 22, 2023 at 06:25:13AM +0000, Joel Stanley wrote:<br=
></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Ar=
ial, sans-serif;">&gt; On Wed, 22 Feb 2023 at 06:11, Tao Ren &lt;<a href=3D=
"mailto:rentao.bupt@gmail.com" style=3D"color: rgb(25, 106, 212); text-deco=
ration-line: underline;" rel=3D"nofollow" target=3D"_blank">rentao.bupt@gma=
il.com</a>&gt; wrote:<br></div><div dir=3D"ltr" style=3D"font-family: Helve=
tica Neue, Helvetica, Arial, sans-serif;">&gt; &gt;<br></div><div dir=3D"lt=
r" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt=
; &gt; Hi Joel,<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica N=
eue, Helvetica, Arial, sans-serif;">&gt; &gt;<br></div><div dir=3D"ltr" sty=
le=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; &gt;=
 Thanks for the update. Let me move some Meta/Facebook AST2500 and<br></div=
><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, s=
ans-serif;">&gt; &gt; AST2600 Network OpenBMCs to v6.1, and will share my f=
indings later.<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif;">&gt;<br></div><div dir=3D"ltr" style=3D"=
font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; Thanks Tao=
, I appreciate it.<br></div><div dir=3D"ltr" style=3D"font-family: Helvetic=
a Neue, Helvetica, Arial, sans-serif;"><br></div><div dir=3D"ltr" style=3D"=
font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">Just heads up I=
 sanity tested dev-6.1 branch on 3 aspeed generations,<br></div><div dir=3D=
"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">=
and everything looks normal. The 3 openbmc platforms are:<br></div><div dir=
=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif=
;">&nbsp; - wedge100 (AST2400)<br></div><div dir=3D"ltr" style=3D"font-fami=
ly: Helvetica Neue, Helvetica, Arial, sans-serif;">&nbsp; - cmm (AST2500)<b=
r></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, A=
rial, sans-serif;">&nbsp; - fbdarwin (AST2600, dts to be upstreamed)<br></d=
iv><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial,=
 sans-serif;"><br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif;">&gt;<br></div><div dir=3D"ltr" style=3D"=
font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; &gt; Besid=
es, could you please share your long term kernel upgrade plan? For<br></div=
><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, s=
ans-serif;">&gt; &gt; example, are you planning to align with LTS kernel in=
 the future? Or the<br></div><div dir=3D"ltr" style=3D"font-family: Helveti=
ca Neue, Helvetica, Arial, sans-serif;">&gt; &gt; ultimate goal is to upgra=
de openbmc kernel whenever newer kernel is<br></div><div dir=3D"ltr" style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; &gt; r=
eleased?<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, He=
lvetica, Arial, sans-serif;">&gt;<br></div><div dir=3D"ltr" style=3D"font-f=
amily: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; Somewhere in bet=
ween those two.<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica N=
eue, Helvetica, Arial, sans-serif;">&gt;<br></div><div dir=3D"ltr" style=3D=
"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; If we wer=
e to wait 5 or so years between updates, then we remove the<br></div><div d=
ir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-ser=
if;">&gt; motivation for developers to upstream their code, and I imagine i=
t<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica=
, Arial, sans-serif;">&gt; would be a headache to hunt down regressions whe=
n making that big<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica=
 Neue, Helvetica, Arial, sans-serif;">&gt; jump.<br></div><div dir=3D"ltr" =
style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt;<b=
r></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, A=
rial, sans-serif;">&gt; On the other hand, management has been trained to t=
arget the stable<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica =
Neue, Helvetica, Arial, sans-serif;">&gt; releases and somehow consider the=
m to be better than others. I argue<br></div><div dir=3D"ltr" style=3D"font=
-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; this isn't tru=
e, because the code is only as stable as the test and<br></div><div dir=3D"=
ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&=
gt; development resources that are put into it! That said, it's less work<b=
r></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, A=
rial, sans-serif;">&gt; to merge in the stable tree every week or two and t=
est that than it is<br></div><div dir=3D"ltr" style=3D"font-family: Helveti=
ca Neue, Helvetica, Arial, sans-serif;">&gt; to do a new rebase every three=
 months.<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, He=
lvetica, Arial, sans-serif;">&gt;<br></div><div dir=3D"ltr" style=3D"font-f=
amily: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; The ultimate goa=
l is to have all of our code upstream, and just use<br></div><div dir=3D"lt=
r" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt=
; whatever kernel yocto has. We're pretty close for aspeed machines; at<br>=
</div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Ari=
al, sans-serif;">&gt; IBM we have some downstream hacks for misbehaving i2c=
 devices, and<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neu=
e, Helvetica, Arial, sans-serif;">&gt; some device trees for pre-production=
 hardware that have minor<br></div><div dir=3D"ltr" style=3D"font-family: H=
elvetica Neue, Helvetica, Arial, sans-serif;">&gt; differences to the produ=
ction version. If we were to upstream the<br></div><div dir=3D"ltr" style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; hacks =
for i2c devices (or stop using them) then we could ship upstream<br></div><=
div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, san=
s-serif;">&gt; kernels.<br></div><div dir=3D"ltr" style=3D"font-family: Hel=
vetica Neue, Helvetica, Arial, sans-serif;">&gt;<br></div><div dir=3D"ltr" =
style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; U=
ltimately it would be best for the project if we used the latest<br></div><=
div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, san=
s-serif;">&gt; kernel on master, and had a LTS kernel that was used by prod=
uct<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helveti=
ca, Arial, sans-serif;">&gt; branches. This would require the project to fu=
nd someone to do this<br></div><div dir=3D"ltr" style=3D"font-family: Helve=
tica Neue, Helvetica, Arial, sans-serif;">&gt; work long term, to ensure th=
e stable updates haven't caused<br></div><div dir=3D"ltr" style=3D"font-fam=
ily: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; regressions, to ch=
erry pick patches that fix code that was not present<br></div><div dir=3D"l=
tr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&g=
t; in the upstream release, and in their remaining time help get more<br></=
div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial=
, sans-serif;">&gt; code in mainline.<br></div><div dir=3D"ltr" style=3D"fo=
nt-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt;<br></div><di=
v dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-=
serif;">&gt; Cheers,<br></div><div dir=3D"ltr" style=3D"font-family: Helvet=
ica Neue, Helvetica, Arial, sans-serif;">&gt;<br></div><div dir=3D"ltr" sty=
le=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt; Joel=
<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica,=
 Arial, sans-serif;"><br></div><div dir=3D"ltr" style=3D"font-family: Helve=
tica Neue, Helvetica, Arial, sans-serif;">Thanks for sharing the details, a=
nd in short, I'm moving torward the<br></div><div dir=3D"ltr" style=3D"font=
-family: Helvetica Neue, Helvetica, Arial, sans-serif;">similar direction:)=
<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica,=
 Arial, sans-serif;"><br></div><div dir=3D"ltr" style=3D"font-family: Helve=
tica Neue, Helvetica, Arial, sans-serif;">My current plan is to upgrade ope=
nbmc kernel at least once a year<br></div><div dir=3D"ltr" style=3D"font-fa=
mily: Helvetica Neue, Helvetica, Arial, sans-serif;">(skipping ~4 kernel re=
leases) for facebook network openbmc platforms,<br></div><div dir=3D"ltr" s=
tyle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">and I'm=
 facing the similar challenges: upstreaming kernel patches and<br></div><di=
v dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-=
serif;">test enhancement. I don't have plan to force more frequent kernel<b=
r></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, A=
rial, sans-serif;">upgrade in 2023, because if I had bandwidth, I'd rather =
spend the time<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif;">upstreaming patches: I believe kernel up=
grade would be much easier if<br></div><div dir=3D"ltr" style=3D"font-famil=
y: Helvetica Neue, Helvetica, Arial, sans-serif;">all the patches are upstr=
eamed.<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helv=
etica, Arial, sans-serif;"><br></div><div dir=3D"ltr" style=3D"font-family:=
 Helvetica Neue, Helvetica, Arial, sans-serif;">I quickly went through the =
local kernel patches in my repo, and they<br></div><div dir=3D"ltr" style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">fall in 3 m=
ajor categories: 1) JTAG master drivers 2) hwmon drivers 3)<br></div><div d=
ir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-ser=
if;">enabling dsa in a few dts files. I'm not sure if anyone is actively<br=
></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Ar=
ial, sans-serif;">looking into the jtag patch series, but I will try my bes=
t to clean up<br></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neu=
e, Helvetica, Arial, sans-serif;">some patches in #2 and #3 this year.<br><=
/div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Aria=
l, sans-serif;"><br></div><div dir=3D"ltr" style=3D"font-family: Helvetica =
Neue, Helvetica, Arial, sans-serif;">BTW, I will create the recipe to fetch=
 dev-6.1 into meta/facebook<br></div><div dir=3D"ltr" style=3D"font-family:=
 Helvetica Neue, Helvetica, Arial, sans-serif;">openbmc tree soon. Thanks a=
gain for maintaining the tree.<br></div><div dir=3D"ltr" style=3D"font-fami=
ly: Helvetica Neue, Helvetica, Arial, sans-serif;"><br></div><div dir=3D"lt=
r" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;"><br=
></div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Ar=
ial, sans-serif;">Cheers,<br></div><div dir=3D"ltr" style=3D"font-family: H=
elvetica Neue, Helvetica, Arial, sans-serif;"><br></div><div dir=3D"ltr" st=
yle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">Tao</div=
></div><br></div>
       =20
        </div><div id=3D"yahoo_quoted_8144965515" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Friday, February 24, 2023 at 03:08:44 AM GMT+3, open=
bmc-request@lists.ozlabs.org &lt;openbmc-request@lists.ozlabs.org&gt; wrote=
:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">Send openbmc mailing list submissions=
 to<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; <a ymailto=3D"mailto:openb=
mc@lists.ozlabs.org" href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists=
.ozlabs.org</a><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">To sub=
scribe or unsubscribe via the World Wide Web, visit<br></div><div dir=3D"lt=
r">&nbsp;&nbsp;&nbsp; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc"=
 target=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br></div><=
div dir=3D"ltr">or, via email, send a message with subject or body 'help' t=
o<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; <a ymailto=3D"mailto:openbmc=
-request@lists.ozlabs.org" href=3D"mailto:openbmc-request@lists.ozlabs.org"=
>openbmc-request@lists.ozlabs.org</a><br></div><div dir=3D"ltr"><br></div><=
div dir=3D"ltr">You can reach the person managing the list at<br></div><div=
 dir=3D"ltr">&nbsp;&nbsp;&nbsp; <a ymailto=3D"mailto:openbmc-owner@lists.oz=
labs.org" href=3D"mailto:openbmc-owner@lists.ozlabs.org">openbmc-owner@list=
s.ozlabs.org</a><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">When =
replying, please edit your Subject line so it is more specific<br></div><di=
v dir=3D"ltr">than "Re: Contents of openbmc digest..."<br></div><div dir=3D=
"ltr"><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Today's Topics:=
<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">&nbsp;  1. Re: OpenBM=
C Linux 6.1 (Tao Ren)<br></div><div dir=3D"ltr">&nbsp;  2. RE: [PATCH v5 1/=
2] dt-bindings: i2c: Add support for ASPEED<br></div><div dir=3D"ltr">&nbsp=
; &nbsp; &nbsp; i2Cv2 (Ryan Chen)<br></div><div dir=3D"ltr">&nbsp;  3. [PAT=
CH v2 0/3] ARM: dts: aspeed: ASRock BMC updates (Zev Weiss)<br></div><div d=
ir=3D"ltr">&nbsp;  4. [PATCH v2 3/3] ARM: dts: aspeed: asrock: Correct firm=
ware<br></div><div dir=3D"ltr">&nbsp; &nbsp; &nbsp; flash SPI clocks (Zev W=
eiss)<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><div d=
ir=3D"ltr">----------------------------------------------------------------=
------<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Message: 1<br><=
/div><div dir=3D"ltr">Date: Wed, 22 Feb 2023 23:33:29 -0800<br></div><div d=
ir=3D"ltr">From: Tao Ren &lt;<a ymailto=3D"mailto:rentao.bupt@gmail.com" hr=
ef=3D"mailto:rentao.bupt@gmail.com">rentao.bupt@gmail.com</a>&gt;<br></div>=
<div dir=3D"ltr">To: Joel Stanley &lt;<a ymailto=3D"mailto:joel@jms.id.au" =
href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt;<br></div><div dir=3D"=
ltr">Cc: OpenBMC Maillist &lt;<a ymailto=3D"mailto:openbmc@lists.ozlabs.org=
" href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;=
<br></div><div dir=3D"ltr">Subject: Re: OpenBMC Linux 6.1<br></div><div dir=
=3D"ltr">Message-ID: &lt;Y/<a ymailto=3D"mailto:cWyUVGkYA2UvBp@fedora" href=
=3D"mailto:cWyUVGkYA2UvBp@fedora">cWyUVGkYA2UvBp@fedora</a>&gt;<br></div><d=
iv dir=3D"ltr">Content-Type: text/plain; charset=3Dus-ascii<br></div><div d=
ir=3D"ltr"><br></div><div dir=3D"ltr">On Wed, Feb 22, 2023 at 06:25:13AM +0=
000, Joel Stanley wrote:<br></div><div dir=3D"ltr">&gt; On Wed, 22 Feb 2023=
 at 06:11, Tao Ren &lt;<a ymailto=3D"mailto:rentao.bupt@gmail.com" href=3D"=
mailto:rentao.bupt@gmail.com">rentao.bupt@gmail.com</a>&gt; wrote:<br></div=
><div dir=3D"ltr">&gt; &gt;<br></div><div dir=3D"ltr">&gt; &gt; Hi Joel,<br=
></div><div dir=3D"ltr">&gt; &gt;<br></div><div dir=3D"ltr">&gt; &gt; Thank=
s for the update. Let me move some Meta/Facebook AST2500 and<br></div><div =
dir=3D"ltr">&gt; &gt; AST2600 Network OpenBMCs to v6.1, and will share my f=
indings later.<br></div><div dir=3D"ltr">&gt; <br></div><div dir=3D"ltr">&g=
t; Thanks Tao, I appreciate it.<br></div><div dir=3D"ltr"><br></div><div di=
r=3D"ltr">Just heads up I sanity tested dev-6.1 branch on 3 aspeed generati=
ons,<br></div><div dir=3D"ltr">and everything looks normal. The 3 openbmc p=
latforms are:<br></div><div dir=3D"ltr">&nbsp; - wedge100 (AST2400)<br></di=
v><div dir=3D"ltr">&nbsp; - cmm (AST2500)<br></div><div dir=3D"ltr">&nbsp; =
- fbdarwin (AST2600, dts to be upstreamed)<br></div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr">&gt; <br></div><div dir=3D"ltr">&gt; &gt; Besides, cou=
ld you please share your long term kernel upgrade plan? For<br></div><div d=
ir=3D"ltr">&gt; &gt; example, are you planning to align with LTS kernel in =
the future? Or the<br></div><div dir=3D"ltr">&gt; &gt; ultimate goal is to =
upgrade openbmc kernel whenever newer kernel is<br></div><div dir=3D"ltr">&=
gt; &gt; released?<br></div><div dir=3D"ltr">&gt; <br></div><div dir=3D"ltr=
">&gt; Somewhere in between those two.<br></div><div dir=3D"ltr">&gt; <br><=
/div><div dir=3D"ltr">&gt; If we were to wait 5 or so years between updates=
, then we remove the<br></div><div dir=3D"ltr">&gt; motivation for develope=
rs to upstream their code, and I imagine it<br></div><div dir=3D"ltr">&gt; =
would be a headache to hunt down regressions when making that big<br></div>=
<div dir=3D"ltr">&gt; jump.<br></div><div dir=3D"ltr">&gt; <br></div><div d=
ir=3D"ltr">&gt; On the other hand, management has been trained to target th=
e stable<br></div><div dir=3D"ltr">&gt; releases and somehow consider them =
to be better than others. I argue<br></div><div dir=3D"ltr">&gt; this isn't=
 true, because the code is only as stable as the test and<br></div><div dir=
=3D"ltr">&gt; development resources that are put into it! That said, it's l=
ess work<br></div><div dir=3D"ltr">&gt; to merge in the stable tree every w=
eek or two and test that than it is<br></div><div dir=3D"ltr">&gt; to do a =
new rebase every three months.<br></div><div dir=3D"ltr">&gt; <br></div><di=
v dir=3D"ltr">&gt; The ultimate goal is to have all of our code upstream, a=
nd just use<br></div><div dir=3D"ltr">&gt; whatever kernel yocto has. We're=
 pretty close for aspeed machines; at<br></div><div dir=3D"ltr">&gt; IBM we=
 have some downstream hacks for misbehaving i2c devices, and<br></div><div =
dir=3D"ltr">&gt; some device trees for pre-production hardware that have mi=
nor<br></div><div dir=3D"ltr">&gt; differences to the production version. I=
f we were to upstream the<br></div><div dir=3D"ltr">&gt; hacks for i2c devi=
ces (or stop using them) then we could ship upstream<br></div><div dir=3D"l=
tr">&gt; kernels.<br></div><div dir=3D"ltr">&gt; <br></div><div dir=3D"ltr"=
>&gt; Ultimately it would be best for the project if we used the latest<br>=
</div><div dir=3D"ltr">&gt; kernel on master, and had a LTS kernel that was=
 used by product<br></div><div dir=3D"ltr">&gt; branches. This would requir=
e the project to fund someone to do this<br></div><div dir=3D"ltr">&gt; wor=
k long term, to ensure the stable updates haven't caused<br></div><div dir=
=3D"ltr">&gt; regressions, to cherry pick patches that fix code that was no=
t present<br></div><div dir=3D"ltr">&gt; in the upstream release, and in th=
eir remaining time help get more<br></div><div dir=3D"ltr">&gt; code in mai=
nline.<br></div><div dir=3D"ltr">&gt; <br></div><div dir=3D"ltr">&gt; Cheer=
s,<br></div><div dir=3D"ltr">&gt; <br></div><div dir=3D"ltr">&gt; Joel<br><=
/div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Thanks for sharing the det=
ails, and in short, I'm moving torward the<br></div><div dir=3D"ltr">simila=
r direction:)<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">My curre=
nt plan is to upgrade openbmc kernel at least once a year<br></div><div dir=
=3D"ltr">(skipping ~4 kernel releases) for facebook network openbmc platfor=
ms,<br></div><div dir=3D"ltr">and I'm facing the similar challenges: upstre=
aming kernel patches and<br></div><div dir=3D"ltr">test enhancement. I don'=
t have plan to force more frequent kernel<br></div><div dir=3D"ltr">upgrade=
 in 2023, because if I had bandwidth, I'd rather spend the time<br></div><d=
iv dir=3D"ltr">upstreaming patches: I believe kernel upgrade would be much =
easier if<br></div><div dir=3D"ltr">all the patches are upstreamed.<br></di=
v><div dir=3D"ltr"><br></div><div dir=3D"ltr">I quickly went through the lo=
cal kernel patches in my repo, and they<br></div><div dir=3D"ltr">fall in 3=
 major categories: 1) JTAG master drivers 2) hwmon drivers 3)<br></div><div=
 dir=3D"ltr">enabling dsa in a few dts files. I'm not sure if anyone is act=
ively<br></div><div dir=3D"ltr">looking into the jtag patch series, but I w=
ill try my best to clean up<br></div><div dir=3D"ltr">some patches in #2 an=
d #3 this year.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">BTW, I=
 will create the recipe to fetch dev-6.1 into meta/facebook<br></div><div d=
ir=3D"ltr">openbmc tree soon. Thanks again for maintaining the tree.<br></d=
iv><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">C=
heers,<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Tao<br></div><d=
iv dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">------=
------------------------<br></div><div dir=3D"ltr"><br></div><div dir=3D"lt=
r">Message: 2<br></div><div dir=3D"ltr">Date: Thu, 23 Feb 2023 10:25:56 +00=
00<br></div><div dir=3D"ltr">From: Ryan Chen &lt;<a ymailto=3D"mailto:ryan_=
chen@aspeedtech.com" href=3D"mailto:ryan_chen@aspeedtech.com">ryan_chen@asp=
eedtech.com</a>&gt;<br></div><div dir=3D"ltr">To: Krzysztof Kozlowski &lt;<=
a ymailto=3D"mailto:krzysztof.kozlowski@linaro.org" href=3D"mailto:krzyszto=
f.kozlowski@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt;, Rob Herring=
<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; &lt;robh+<a ymailto=3D"mailto=
:dt@kernel.org" href=3D"mailto:dt@kernel.org">dt@kernel.org</a>&gt;, Krzysz=
tof Kozlowski<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; &lt;krzysztof.ko=
zlowski+<a ymailto=3D"mailto:dt@linaro.org" href=3D"mailto:dt@linaro.org">d=
t@linaro.org</a>&gt;, Joel Stanley &lt;<a ymailto=3D"mailto:joel@jms.id.au"=
 href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt;,<br></div><div dir=
=3D"ltr">&nbsp;&nbsp;&nbsp; Andrew Jeffery &lt;<a ymailto=3D"mailto:andrew@=
aj.id.au" href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt;, Philipp =
Zabel<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; &lt;<a ymailto=3D"mailto=
:p.zabel@pengutronix.de" href=3D"mailto:p.zabel@pengutronix.de">p.zabel@pen=
gutronix.de</a>&gt;,&nbsp;&nbsp;&nbsp; "<a ymailto=3D"mailto:openbmc@lists.=
ozlabs.org" href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.o=
rg</a>"<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; &lt;<a ymailto=3D"mail=
to:openbmc@lists.ozlabs.org" href=3D"mailto:openbmc@lists.ozlabs.org">openb=
mc@lists.ozlabs.org</a>&gt;,&nbsp;&nbsp;&nbsp; "<a ymailto=3D"mailto:linux-=
arm-kernel@lists.infradead.org" href=3D"mailto:linux-arm-kernel@lists.infra=
dead.org">linux-arm-kernel@lists.infradead.org</a>"<br></div><div dir=3D"lt=
r">&nbsp;&nbsp;&nbsp; &lt;<a ymailto=3D"mailto:linux-arm-kernel@lists.infra=
dead.org" href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-ke=
rnel@lists.infradead.org</a>&gt;,<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nb=
sp; "<a ymailto=3D"mailto:linux-aspeed@lists.ozlabs.org" href=3D"mailto:lin=
ux-aspeed@lists.ozlabs.org">linux-aspeed@lists.ozlabs.org</a>"&nbsp;&nbsp;&=
nbsp; &lt;<a ymailto=3D"mailto:linux-aspeed@lists.ozlabs.org" href=3D"mailt=
o:linux-aspeed@lists.ozlabs.org">linux-aspeed@lists.ozlabs.org</a>&gt;,<br>=
</div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; "<a ymailto=3D"mailto:linux-kerne=
l@vger.kernel.org" href=3D"mailto:linux-kernel@vger.kernel.org">linux-kerne=
l@vger.kernel.org</a>"&nbsp;&nbsp;&nbsp; &lt;<a ymailto=3D"mailto:linux-ker=
nel@vger.kernel.org" href=3D"mailto:linux-kernel@vger.kernel.org">linux-ker=
nel@vger.kernel.org</a>&gt;<br></div><div dir=3D"ltr">Subject: RE: [PATCH v=
5 1/2] dt-bindings: i2c: Add support for ASPEED<br></div><div dir=3D"ltr">&=
nbsp;&nbsp;&nbsp; i2Cv2<br></div><div dir=3D"ltr">Message-ID:<br></div><div=
 dir=3D"ltr">&nbsp;&nbsp;&nbsp; &lt;<a ymailto=3D"mailto:SEZPR06MB526977475=
28490B1A16AF87FF2AB9@SEZPR06MB5269.apcprd06.prod.outlook.com" href=3D"mailt=
o:SEZPR06MB52697747528490B1A16AF87FF2AB9@SEZPR06MB5269.apcprd06.prod.outloo=
k.com">SEZPR06MB52697747528490B1A16AF87FF2AB9@SEZPR06MB5269.apcprd06.prod.o=
utlook.com</a>&gt;<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; <br></div><=
div dir=3D"ltr">Content-Type: text/plain; charset=3D"utf-8"<br></div><div d=
ir=3D"ltr"><br></div><div dir=3D"ltr">Hello Krzysztof,<br></div><div dir=3D=
"ltr"><br></div><div dir=3D"ltr">&gt; -----Original Message-----<br></div><=
div dir=3D"ltr">&gt; From: Krzysztof Kozlowski &lt;<a ymailto=3D"mailto:krz=
ysztof.kozlowski@linaro.org" href=3D"mailto:krzysztof.kozlowski@linaro.org"=
>krzysztof.kozlowski@linaro.org</a>&gt;<br></div><div dir=3D"ltr">&gt; Sent=
: Thursday, February 23, 2023 5:29 PM<br></div><div dir=3D"ltr">&gt; To: Ry=
an Chen &lt;<a ymailto=3D"mailto:ryan_chen@aspeedtech.com" href=3D"mailto:r=
yan_chen@aspeedtech.com">ryan_chen@aspeedtech.com</a>&gt;; Rob Herring<br><=
/div><div dir=3D"ltr">&gt; &lt;robh+<a ymailto=3D"mailto:dt@kernel.org" hre=
f=3D"mailto:dt@kernel.org">dt@kernel.org</a>&gt;; Krzysztof Kozlowski<br></=
div><div dir=3D"ltr">&gt; &lt;krzysztof.kozlowski+<a ymailto=3D"mailto:dt@l=
inaro.org" href=3D"mailto:dt@linaro.org">dt@linaro.org</a>&gt;; Joel Stanle=
y &lt;<a ymailto=3D"mailto:joel@jms.id.au" href=3D"mailto:joel@jms.id.au">j=
oel@jms.id.au</a>&gt;; Andrew<br></div><div dir=3D"ltr">&gt; Jeffery &lt;<a=
 ymailto=3D"mailto:andrew@aj.id.au" href=3D"mailto:andrew@aj.id.au">andrew@=
aj.id.au</a>&gt;; Philipp Zabel &lt;<a ymailto=3D"mailto:p.zabel@pengutroni=
x.de" href=3D"mailto:p.zabel@pengutronix.de">p.zabel@pengutronix.de</a>&gt;=
;<br></div><div dir=3D"ltr">&gt; <a ymailto=3D"mailto:openbmc@lists.ozlabs.=
org" href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>;=
 <a ymailto=3D"mailto:linux-arm-kernel@lists.infradead.org" href=3D"mailto:=
linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org<=
/a>;<br></div><div dir=3D"ltr">&gt; <a ymailto=3D"mailto:linux-aspeed@lists=
.ozlabs.org" href=3D"mailto:linux-aspeed@lists.ozlabs.org">linux-aspeed@lis=
ts.ozlabs.org</a>; <a ymailto=3D"mailto:linux-kernel@vger.kernel.org" href=
=3D"mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a><b=
r></div><div dir=3D"ltr">&gt; Subject: Re: [PATCH v5 1/2] dt-bindings: i2c:=
 Add support for ASPEED i2Cv2<br></div><div dir=3D"ltr">&gt; <br></div><div=
 dir=3D"ltr">&gt; On 22/02/2023 11:47, Ryan Chen wrote:<br></div><div dir=
=3D"ltr">&gt; &gt;&gt;&gt;&gt; connector. That slave will keep state to dri=
ve clock stretching.<br></div><div dir=3D"ltr">&gt; &gt;&gt;&gt;&gt;&gt; So=
 it is specific enable in i2c bus#1. Others is not needed enable<br></div><=
div dir=3D"ltr">&gt; timeout.<br></div><div dir=3D"ltr">&gt; &gt;&gt;&gt;&g=
t;&gt; Does this draw is more clear in scenario?<br></div><div dir=3D"ltr">=
&gt; &gt;&gt;&gt;&gt;<br></div><div dir=3D"ltr">&gt; &gt;&gt;&gt;&gt; I2C b=
us #1 works in slave mode? So you always need it for slave work?<br></div><=
div dir=3D"ltr">&gt; &gt;&gt;&gt;<br></div><div dir=3D"ltr">&gt; &gt;&gt;&g=
t; Yes, it is both slave/master mode. It is always dual role. Slave<br></di=
v><div dir=3D"ltr">&gt; &gt;&gt;&gt; must always<br></div><div dir=3D"ltr">=
&gt; &gt;&gt; work.<br></div><div dir=3D"ltr">&gt; &gt;&gt;&gt; Due to anot=
her board master will send.<br></div><div dir=3D"ltr">&gt; &gt;&gt;<br></di=
v><div dir=3D"ltr">&gt; &gt;&gt; I meant that you need this property when i=
t works in slave mode? It<br></div><div dir=3D"ltr">&gt; &gt;&gt; would be =
then redundant to have in DT as it is implied by the mode.<br></div><div di=
r=3D"ltr">&gt; &gt;<br></div><div dir=3D"ltr">&gt; &gt; But timeout feature=
 is also apply in master. It for avoid suddenly<br></div><div dir=3D"ltr">&=
gt; &gt; slave miss(un-plug) Master can timeout and release the SDA/SCL, re=
turn.<br></div><div dir=3D"ltr">&gt; <br></div><div dir=3D"ltr">&gt; OK, ye=
t the property should describe the hardware, not the register feature you<b=
r></div><div dir=3D"ltr">&gt; want to program. You need to properly model i=
t in DT binding to represent<br></div><div dir=3D"ltr">&gt; hardware setup,=
 not your desired Linux driver behavior.<br></div><div dir=3D"ltr">&gt; <br=
></div><div dir=3D"ltr">&gt; &gt;&gt;&gt;&gt;&gt; The same draw, in this ca=
se, i2c bus#1 that is multi-master<br></div><div dir=3D"ltr">&gt; &gt;&gt;&=
gt;&gt;&gt; transfer<br></div><div dir=3D"ltr">&gt; &gt;&gt;&gt;&gt; archit=
ecture.<br></div><div dir=3D"ltr">&gt; &gt;&gt;&gt;&gt;&gt; Both will inact=
ive with trunk data. That cane enable i2c#1 use DMA<br></div><div dir=3D"lt=
r">&gt; &gt;&gt;&gt;&gt;&gt; transfer<br></div><div dir=3D"ltr">&gt; &gt;&g=
t;&gt;&gt; to reduce CPU utilized.<br></div><div dir=3D"ltr">&gt; &gt;&gt;&=
gt;&gt;&gt; Others (bus#2/3) can keep byte/buff mode.<br></div><div dir=3D"=
ltr">&gt; &gt;&gt;&gt;&gt;<br></div><div dir=3D"ltr">&gt; &gt;&gt;&gt;&gt; =
Isn't then current bus configuration for I2C#1 known to the driver?<br></di=
v><div dir=3D"ltr">&gt; &gt;&gt;&gt;&gt; Jeremy asked few other questions a=
round here...<br></div><div dir=3D"ltr">&gt; &gt;&gt;&gt;<br></div><div dir=
=3D"ltr">&gt; &gt;&gt;&gt; No, The driver don't know currently board config=
uration.<br></div><div dir=3D"ltr">&gt; &gt;&gt;<br></div><div dir=3D"ltr">=
&gt; &gt;&gt; It knows whether it is working in multi-master/slave mode.<br=
></div><div dir=3D"ltr">&gt; &gt;<br></div><div dir=3D"ltr">&gt; &gt; But i=
n DT can decide which i2c bus number can use dma or buffer mode<br></div><d=
iv dir=3D"ltr">&gt; transfer.<br></div><div dir=3D"ltr">&gt; &gt; If in ano=
ther i2c bus support master only, also can use dma to transfer trunk<br></d=
iv><div dir=3D"ltr">&gt; data to another slave.<br></div><div dir=3D"ltr">&=
gt; <br></div><div dir=3D"ltr">&gt; and none of these were explained in com=
mit msg or device description.<br></div><div dir=3D"ltr">&gt; <br></div><di=
v dir=3D"ltr">Thanks your guidance. I will add all those discussion in next=
 patches cover-letter.<br></div><div dir=3D"ltr">Best regards,<br></div><di=
v dir=3D"ltr">Ryan Chen.<br></div><div dir=3D"ltr"><br></div><div dir=3D"lt=
r">------------------------------<br></div><div dir=3D"ltr"><br></div><div =
dir=3D"ltr">Message: 3<br></div><div dir=3D"ltr">Date: Thu, 23 Feb 2023 16:=
03:57 -0800<br></div><div dir=3D"ltr">From: Zev Weiss &lt;<a ymailto=3D"mai=
lto:zev@bewilderbeest.net" href=3D"mailto:zev@bewilderbeest.net">zev@bewild=
erbeest.net</a>&gt;<br></div><div dir=3D"ltr">To: Andrew Jeffery &lt;<a yma=
ilto=3D"mailto:andrew@aj.id.au" href=3D"mailto:andrew@aj.id.au">andrew@aj.i=
d.au</a>&gt;,&nbsp;&nbsp;&nbsp; Joel Stanley &lt;<a ymailto=3D"mailto:joel@=
jms.id.au" href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt;<br></div><=
div dir=3D"ltr">Cc: Zev Weiss &lt;<a ymailto=3D"mailto:zev@bewilderbeest.ne=
t" href=3D"mailto:zev@bewilderbeest.net">zev@bewilderbeest.net</a>&gt;,&nbs=
p;&nbsp;&nbsp; <a ymailto=3D"mailto:openbmc@lists.ozlabs.org" href=3D"mailt=
o:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>,<br></div><div dir=
=3D"ltr">&nbsp;&nbsp;&nbsp; Krzysztof Kozlowski &lt;krzysztof.kozlowski+<a =
ymailto=3D"mailto:dt@linaro.org" href=3D"mailto:dt@linaro.org">dt@linaro.or=
g</a>&gt;,&nbsp;&nbsp;&nbsp; Rob Herring<br></div><div dir=3D"ltr">&nbsp;&n=
bsp;&nbsp; &lt;robh+<a ymailto=3D"mailto:dt@kernel.org" href=3D"mailto:dt@k=
ernel.org">dt@kernel.org</a>&gt;,&nbsp;&nbsp;&nbsp; <a ymailto=3D"mailto:de=
vicetree@vger.kernel.org" href=3D"mailto:devicetree@vger.kernel.org">device=
tree@vger.kernel.org</a>,<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; <a y=
mailto=3D"mailto:linux-arm-kernel@lists.infradead.org" href=3D"mailto:linux=
-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>,&=
nbsp;&nbsp;&nbsp; <a ymailto=3D"mailto:linux-aspeed@lists.ozlabs.org" href=
=3D"mailto:linux-aspeed@lists.ozlabs.org">linux-aspeed@lists.ozlabs.org</a>=
,<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; <a ymailto=3D"mailto:linux-k=
ernel@vger.kernel.org" href=3D"mailto:linux-kernel@vger.kernel.org">linux-k=
ernel@vger.kernel.org</a><br></div><div dir=3D"ltr">Subject: [PATCH v2 0/3]=
 ARM: dts: aspeed: ASRock BMC updates<br></div><div dir=3D"ltr">Message-ID:=
 &lt;<a ymailto=3D"mailto:20230224000400.12226-1-zev@bewilderbeest.net" hre=
f=3D"mailto:20230224000400.12226-1-zev@bewilderbeest.net">20230224000400.12=
226-1-zev@bewilderbeest.net</a>&gt;<br></div><div dir=3D"ltr"><br></div><di=
v dir=3D"ltr">Hello,<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">T=
his patch series contains a few small device-tree updates for ASRock<br></d=
iv><div dir=3D"ltr">BMCs: an LED polarity fix for romed8hm3, enabling the a=
st2500 PECI<br></div><div dir=3D"ltr">device on e3c246d4i, and a SPI flash =
clock frequency fix for both.<br></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">Thanks,<br></div><div dir=3D"ltr">Zev<br></div><div dir=3D"ltr"><b=
r></div><div dir=3D"ltr">Changes since v1 [0]:<br></div><div dir=3D"ltr"> -=
 Added patch 3 correcting SPI flash clocks<br></div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr">[0] <a href=3D"https://lore.kernel.org/linux-devicetre=
e/20230203105405.21942-1-zev@bewilderbeest.net/" target=3D"_blank">https://=
lore.kernel.org/linux-devicetree/20230203105405.21942-1-zev@bewilderbeest.n=
et/</a><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Zev Weiss (3):=
<br></div><div dir=3D"ltr">&nbsp; ARM: dts: aspeed: romed8hm3: Fix GPIO pol=
arity of system-fault LED<br></div><div dir=3D"ltr">&nbsp; ARM: dts: aspeed=
: e3c246d4i: Add PECI device<br></div><div dir=3D"ltr">&nbsp; ARM: dts: asp=
eed: asrock: Correct firmware flash SPI clocks<br></div><div dir=3D"ltr"><b=
r></div><div dir=3D"ltr"> arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts=
 | 6 +++++-<br></div><div dir=3D"ltr"> arch/arm/boot/dts/aspeed-bmc-asrock-=
romed8hm3.dts | 4 ++--<br></div><div dir=3D"ltr"> 2 files changed, 7 insert=
ions(+), 3 deletions(-)<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr=
">-- <br></div><div dir=3D"ltr">2.39.1.438.gdcb075ea9396.dirty<br></div><di=
v dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></d=
iv><div dir=3D"ltr">------------------------------<br></div><div dir=3D"ltr=
"><br></div><div dir=3D"ltr">Message: 4<br></div><div dir=3D"ltr">Date: Thu=
, 23 Feb 2023 16:04:00 -0800<br></div><div dir=3D"ltr">From: Zev Weiss &lt;=
<a ymailto=3D"mailto:zev@bewilderbeest.net" href=3D"mailto:zev@bewilderbees=
t.net">zev@bewilderbeest.net</a>&gt;<br></div><div dir=3D"ltr">To: Andrew J=
effery &lt;<a ymailto=3D"mailto:andrew@aj.id.au" href=3D"mailto:andrew@aj.i=
d.au">andrew@aj.id.au</a>&gt;,&nbsp;&nbsp;&nbsp; Joel Stanley &lt;<a ymailt=
o=3D"mailto:joel@jms.id.au" href=3D"mailto:joel@jms.id.au">joel@jms.id.au</=
a>&gt;<br></div><div dir=3D"ltr">Cc: Zev Weiss &lt;<a ymailto=3D"mailto:zev=
@bewilderbeest.net" href=3D"mailto:zev@bewilderbeest.net">zev@bewilderbeest=
.net</a>&gt;,&nbsp;&nbsp;&nbsp; Krzysztof Kozlowski<br></div><div dir=3D"lt=
r">&nbsp;&nbsp;&nbsp; &lt;krzysztof.kozlowski+<a ymailto=3D"mailto:dt@linar=
o.org" href=3D"mailto:dt@linaro.org">dt@linaro.org</a>&gt;,&nbsp;&nbsp;&nbs=
p; Rob Herring &lt;robh+<a ymailto=3D"mailto:dt@kernel.org" href=3D"mailto:=
dt@kernel.org">dt@kernel.org</a>&gt;,<br></div><div dir=3D"ltr">&nbsp;&nbsp=
;&nbsp; <a ymailto=3D"mailto:devicetree@vger.kernel.org" href=3D"mailto:dev=
icetree@vger.kernel.org">devicetree@vger.kernel.org</a>,&nbsp;&nbsp;&nbsp; =
<a ymailto=3D"mailto:linux-arm-kernel@lists.infradead.org" href=3D"mailto:l=
inux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</=
a>,<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; <a ymailto=3D"mailto:linux=
-aspeed@lists.ozlabs.org" href=3D"mailto:linux-aspeed@lists.ozlabs.org">lin=
ux-aspeed@lists.ozlabs.org</a>,&nbsp;&nbsp;&nbsp; <a ymailto=3D"mailto:linu=
x-kernel@vger.kernel.org" href=3D"mailto:linux-kernel@vger.kernel.org">linu=
x-kernel@vger.kernel.org</a>,<br></div><div dir=3D"ltr">&nbsp;&nbsp;&nbsp; =
<a ymailto=3D"mailto:openbmc@lists.ozlabs.org" href=3D"mailto:openbmc@lists=
.ozlabs.org">openbmc@lists.ozlabs.org</a>,&nbsp;&nbsp;&nbsp; <a ymailto=3D"=
mailto:stable@vger.kernel.org" href=3D"mailto:stable@vger.kernel.org">stabl=
e@vger.kernel.org</a><br></div><div dir=3D"ltr">Subject: [PATCH v2 3/3] ARM=
: dts: aspeed: asrock: Correct firmware<br></div><div dir=3D"ltr">&nbsp;&nb=
sp;&nbsp; flash SPI clocks<br></div><div dir=3D"ltr">Message-ID: &lt;<a yma=
ilto=3D"mailto:20230224000400.12226-4-zev@bewilderbeest.net" href=3D"mailto=
:20230224000400.12226-4-zev@bewilderbeest.net">20230224000400.12226-4-zev@b=
ewilderbeest.net</a>&gt;<br></div><div dir=3D"ltr"><br></div><div dir=3D"lt=
r">While I'm not aware of any problems that have occurred running these<br>=
</div><div dir=3D"ltr">at 100 MHz, the official word from ASRock is that 50=
 MHz is the<br></div><div dir=3D"ltr">correct speed to use, so let's be saf=
e and use that instead.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr=
">Signed-off-by: Zev Weiss &lt;<a ymailto=3D"mailto:zev@bewilderbeest.net" =
href=3D"mailto:zev@bewilderbeest.net">zev@bewilderbeest.net</a>&gt;<br></di=
v><div dir=3D"ltr">Cc: <a ymailto=3D"mailto:stable@vger.kernel.org" href=3D=
"mailto:stable@vger.kernel.org">stable@vger.kernel.org</a><br></div><div di=
r=3D"ltr">Fixes: 2b81613ce417 ("ARM: dts: aspeed: Add ASRock E3C246D4I BMC"=
)<br></div><div dir=3D"ltr">Fixes: a9a3d60b937a ("ARM: dts: aspeed: Add ASR=
ock ROMED8HM3 BMC")<br></div><div dir=3D"ltr">---<br></div><div dir=3D"ltr"=
> arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 2 +-<br></div><div di=
r=3D"ltr"> arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 +-<br></di=
v><div dir=3D"ltr"> 2 files changed, 2 insertions(+), 2 deletions(-)<br></d=
iv><div dir=3D"ltr"><br></div><div dir=3D"ltr">diff --git a/arch/arm/boot/d=
ts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3=
c246d4i.dts<br></div><div dir=3D"ltr">index 67a75aeafc2b..c4b2efbfdf56 1006=
44<br></div><div dir=3D"ltr">--- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c2=
46d4i.dts<br></div><div dir=3D"ltr">+++ b/arch/arm/boot/dts/aspeed-bmc-asro=
ck-e3c246d4i.dts<br></div><div dir=3D"ltr">@@ -63,7 +63,7 @@ <a ymailto=3D"=
mailto:flash@0" href=3D"mailto:flash@0">flash@0</a> {<br></div><div dir=3D"=
ltr"> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; status =3D "okay";<br></div><di=
v dir=3D"ltr"> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; m25p,fast-read;<br></d=
iv><div dir=3D"ltr"> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; label =3D "bmc";=
<br></div><div dir=3D"ltr">-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; spi-max-f=
requency =3D &lt;100000000&gt;; /* 100 MHz */<br></div><div dir=3D"ltr">+&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; spi-max-frequency =3D &lt;50000000&gt;;=
 /* 50 MHz */<br></div><div dir=3D"ltr"> #include "openbmc-flash-layout.dts=
i"<br></div><div dir=3D"ltr"> &nbsp;&nbsp;&nbsp; };<br></div><div dir=3D"lt=
r"> };<br></div><div dir=3D"ltr">diff --git a/arch/arm/boot/dts/aspeed-bmc-=
asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts<br=
></div><div dir=3D"ltr">index 00efe1a93a69..4554abf0c7cd 100644<br></div><d=
iv dir=3D"ltr">--- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts<br><=
/div><div dir=3D"ltr">+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.d=
ts<br></div><div dir=3D"ltr">@@ -51,7 +51,7 @@ <a ymailto=3D"mailto:flash@0=
" href=3D"mailto:flash@0">flash@0</a> {<br></div><div dir=3D"ltr"> &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; status =3D "okay";<br></div><div dir=3D"ltr">=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; m25p,fast-read;<br></div><div dir=3D=
"ltr"> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; label =3D "bmc";<br></div><div=
 dir=3D"ltr">-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; spi-max-frequency =3D &=
lt;100000000&gt;; /* 100 MHz */<br></div><div dir=3D"ltr">+&nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; spi-max-frequency =3D &lt;50000000&gt;; /* 50 MHz */<=
br></div><div dir=3D"ltr"> #include "openbmc-flash-layout-64.dtsi"<br></div=
><div dir=3D"ltr"> &nbsp;&nbsp;&nbsp; };<br></div><div dir=3D"ltr"> };<br><=
/div><div dir=3D"ltr">-- <br></div><div dir=3D"ltr">2.39.1.438.gdcb075ea939=
6.dirty<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><div=
 dir=3D"ltr"><br></div><div dir=3D"ltr">End of openbmc Digest, Vol 90, Issu=
e 49<br></div><div dir=3D"ltr">***************************************<br><=
/div></div>
            </div>
        </div></body></html>
------=_Part_192701_1690754858.1677229278178--
