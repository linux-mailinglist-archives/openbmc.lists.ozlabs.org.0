Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC99422BE8
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 17:09:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP1GN3pTrz2yw9
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 02:09:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP1G34kNXz2yP4
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 02:09:30 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 36A6C18011;
 Tue,  5 Oct 2021 11:17:32 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id VnCSGBXzofmC; Tue,  5 Oct 2021 11:17:26 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
 by tuna.sandelman.ca (Postfix) with ESMTP id AF0E918036;
 Tue,  5 Oct 2021 11:17:26 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 6F0FB58B;
 Tue,  5 Oct 2021 11:09:21 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: SPAKE, DTLS and passwords
In-Reply-To: <edfa6abd-e2a2-00ca-3154-59fee4ae125f@linux.ibm.com>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
 <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
 <17277.1633384075@localhost>
 <edfa6abd-e2a2-00ca-3154-59fee4ae125f@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 05 Oct 2021 11:09:21 -0400
Message-ID: <27674.1633446561@localhost>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > On 10/4/21 4:47 PM, Michael Richardson wrote:
    >> Joseph Reynolds <jrey@linux.ibm.com> wrote:
    >> > The planned IPMI over DLTS function will have certificate-based
    >> > authuentication.
    >>
    >> Do you mean that the server will be authenticated with a certificate, or that
    >> it will use mutual authentication?

    > I understand this means mutual-TLS.
    > Based on the gerrit design:
    > https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548/4/designs/ipmi-over-dtls.md

So, why is a password needed?

    > Note that design also says the server will have an identity certificate; same
    > as the HTTPS certificate described in
    > https://github.com/openbmc/bmcweb/blob/master/README.md


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmFcaqEACgkQgItw+93Q
3WUo5Af/Y9LRaWoF1CjbHf6N4QlWwf4KLL4Yma3Mip3c49szYWBkeGyOtdawjUn9
+E3Ke23E1kscwkGddri8kSeZDUzVvC7Sc/MyRMLu29Dn6e6sddf6Cb59dvIOGp2S
nQLk4k+rwjjlfLmkA3tAbb59eRih6BNmSR5oTwtMgZy3wzGFGQWbjorNBfA/i+qu
+wfkxT4i6fWUeeo001dPXvgh9ZnOzSX5XRJUffFmLq9CNLPf/mZRwkmi11aw1nBC
kLDViXcd7Z9w09w3gKZNKhAeBFfGSc/xcC2G0f6l0z3b6UPMTOi9t+bRMS1iDRCj
v/vnR/jfFpyWxSEQAby8Y7iqmXfX2A==
=1tvt
-----END PGP SIGNATURE-----
--=-=-=--
