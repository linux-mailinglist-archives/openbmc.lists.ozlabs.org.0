Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2028AB95
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 04:04:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8hn64qXVzDqrM
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 13:04:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=98.137.64.31;
 helo=sonic307-55.consmr.mail.gq1.yahoo.com;
 envelope-from=geissonator@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=M7K1mOnd; dkim-atps=neutral
Received: from sonic307-55.consmr.mail.gq1.yahoo.com
 (sonic307-55.consmr.mail.gq1.yahoo.com [98.137.64.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6lQs2VGQzDqWm
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 08:56:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1602194185; bh=DWBd8wNdtaWfg/VHFh0TV53uIQplMUBebOHWHWvk6/E=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From:Subject;
 b=M7K1mOndgsXfUuXyjRD5qyNCFq2goJJsJYwtIafhAjqB1psTYzg3YjXG4KkYH/DKkE0NhheljmSteU5/dtt5/aB6MTtox+RL4+dR1K/Bo8eozhAvlT+s4LHBNqHIgQxO+6pcTin930c9jmArjcMpEMiABm/0IN0RHR0c4RtE6MENWIMCBOKyRp+YK32gr0JcQFZtS/DRGld9LySyEhxfFebG16phwWv+NQUY1h8JmtT+d+sCGS+GDEo3ezNvadgskhN6ynQj/h0ijxeI54oscieBB77I9zKCprLkwarsJkPhdu0o6Okh6ScUt6nDs8wgbbJ6PQSmXpT31qCbdBAw4A==
X-YMail-OSG: rp1sZZAVM1l5jVXKKEAZq8HerPO0Hp4qF65Uza8wTs.nol5VSZNnGDwR6TUVotQ
 edt7wzOMPRJCI2c.OEtqn_oAx7z57RVn7B5dJZ9FS2eeigIlZREhlV_IUJC_6fmlkCAVaheKZLE_
 KTBu9IAAtRRAko7uIQL_S0ZTdlnKMEx4JpW4y8oywgjPiEkkgcT68N9pQeoJBt_L8OgODhUWFypU
 CZW.A1LjygoJ8yVgPztKy51tSCjMXZ8LnmHUiYep4RtqxJpKN6yqh0if6cKLAkji3elFOBcZVsDE
 WcrUvapqRUoJ_6ZkEjH8yM3VPr2Vzph88TjB_YWdNfl0imGHgT5ucVdqmv3rlisqg92tkdVNeHfJ
 N.RDWnYNtRrps.e8ebHt03ikXdVcBplM2_KcXZZ56sj9Gm13uvhjLueaWB2REcYLA1E9dcIx9pLT
 I98qMEXbWLUVDJJB7KNrmJaNXhcWyAxxyjpwnAFmRPqIkR08IJ6V3OlMdyaYp8crkinl57.cyFTu
 aTtW8BIQqK3cDiJPe.IZD1qESQ3Ekn7JLEkRILpiqw43fZY9yRI0p9GyEJmF9L8OUmtZie444sKd
 XsvLCB6Q8tBAJrd9cNsbZMBsk0eSwJr6QHye6jVuPk3MTpZAgYAkvt2EP4Q5ZZ.IQbqtRzhBzsXB
 nWjrqp_E2sClAEr5_QS4SxjJv6Dw3JbT9Ki7aRFnwuzXH4FEY4uFZxn0JPEFThRY51W3zbqvsW0H
 XCl3999SROkVfA46GqnAWCJeLFGesQoRcTRF4mIjsHLUMN7AO05hoAPg2E_BSqzgtpLt7AOzOWZg
 ykFdP6KVJd4oF.FgxBCGtZqd6STIdzWRs2RmCDVjrBUlM..DX.eG215OkkuMHvpPQOsgVUzSexol
 2Tv7gkup7ujSyAqXj4CkQJAsinpfphrgvO30q3Uy8HTZ9hryI6BgPklgxJEbEF6dW.qmK5kmutLY
 vjsjmIia7STR1H2FeCZTgEjGTwaaVkJHO6Ns3UAxsIUYfPgZ0akE488Z9anxioAufW5rQkionwPB
 ZD8BBv6_Mut_qhQePQpf84muBba9anmagaNs..o1LLwnyQAkvopUA.yFpth07cw7Y18benxKY7hU
 yQRGT8frNNZTZrTbfQts21lcANj1j.k3diJ_L6ixXzVcdwoB.bTP5SNwLa4DaJbBOcQT8fCSwUdT
 gcFLIO0R9VFjKCdMUifUd903hO2OIpqxlLitiTZYNwmE7P8yIVm.4XwoXMHmFPY8KuNYT6ktsvNP
 eCNdJUqpQa.sM9b_JwV7FDZeHYcGwh081vln9nv79D5e7jSwIuAOZ1ylBHcBYCmmCXqPOG763y03
 MmajPofjZ5BP3jzCKkwDrpbUYBvcRf6jlIWi9d1tT.79p.NC6QWmY8xOIW4BmYm27rkcoEZZSPPo
 a7VuepxzmZYIfln.wG8BO.SVoj18.U9Res6lAhMO95BAa2glko1eH4V65mOz_FrMqLyK_b..uGvS
 U.gmg.Scja5RslUdSpCxtVIEQViND4pbE_9e60fWnZ00qHNclakMU3ymT1ztvCBh5kJJKqkA-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Thu, 8 Oct 2020 21:56:25 +0000
Received: by smtp404.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 902d7ad3e7eff0402fcea41ea2acc268; 
 Thu, 08 Oct 2020 21:56:23 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: Add peci-pcie repo to CI
From: Andrew Geissler <geissonator@yahoo.com>
In-Reply-To: <7d749dad-e4c0-0243-d701-4a6448fe3433@linux.intel.com>
Date: Thu, 8 Oct 2020 16:56:22 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <B433BB55-06A3-45A1-B457-D11E61271682@yahoo.com>
References: <7d749dad-e4c0-0243-d701-4a6448fe3433@linux.intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Mailman-Approved-At: Mon, 12 Oct 2020 13:03:34 +1100
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



> On Oct 8, 2020, at 4:48 PM, Bills, Jason M =
<jason.m.bills@linux.intel.com> wrote:
>=20
> Hi Andrew,
>=20
> Could you please add the openbmc/peci-pcie repo to the CI jobs?

Sure thing, done.

>=20
> https://gerrit.openbmc-project.xyz/c/openbmc/peci-pcie/+/37239
>=20
> Thanks!
> -Jason

