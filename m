Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E105C1DE99D
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 16:49:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49T8XN1JCgzDqy9
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 00:49:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 49T8S42C2BzDqRB
 for <openbmc@lists.ozlabs.org>; Sat, 23 May 2020 00:45:52 +1000 (AEST)
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
 by pokefinder.org (Postfix) with ESMTPSA id 5782F2C203F;
 Fri, 22 May 2020 16:45:48 +0200 (CEST)
Date: Fri, 22 May 2020 16:45:47 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200522144547.GC5670@ninjato>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline
In-Reply-To: <20200521110910.45518-3-tali.perry1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, brendanhiggins@google.com,
 ofery@google.com, linux-kernel@vger.kernel.org, kfting@nuvoton.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 02:09:09PM +0300, Tali Perry wrote:
> Add Nuvoton NPCM BMC I2C controller driver.
>=20
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

This is a very complex driver, so I can really comment only about high
level things. Thank you very much for keeping at it!

My code checkers say:

CHECKPATCH:
CHECK: usleep_range is preferred over udelay; see Documentation/timers/time=
rs-howto.rst
#1210: FILE: drivers/i2c/busses/i2c-npcm7xx.c:1161:
+			udelay(200);

(a few of them)

GCC:
  CC      drivers/i2c/busses/i2c-npcm7xx.o
drivers/i2c/busses/i2c-npcm7xx.c: In function =E2=80=98npcm_i2c_reset=E2=80=
=99:
drivers/i2c/busses/i2c-npcm7xx.c:521:5: warning: variable =E2=80=98i2cctl2=
=E2=80=99 set but not used [-Wunused-but-set-variable]


> +/* Status of one I2C module */
> +struct npcm_i2c {
> +	struct i2c_adapter adap;
> +	struct device *dev;
> +	unsigned char __iomem *reg;
> +	spinlock_t lock;   /* IRQ synchronization */
> +	struct completion cmd_complete;
> +	int irq;
> +	int cmd_err;
> +	struct i2c_msg *msgs;
> +	int msgs_num;
> +	int num;
> +	u32 apb_clk;
> +	struct i2c_bus_recovery_info rinfo;
> +	enum i2c_state state;
> +	enum i2c_oper operation;
> +	enum i2c_mode master_or_slave;
> +	enum i2c_state_ind stop_ind;
> +	u8 dest_addr;
> +	u8 *rd_buf;
> +	u16 rd_size;
> +	u16 rd_ind;
> +	u8 *wr_buf;
> +	u16 wr_size;
> +	u16 wr_ind;
> +	bool fifo_use;
> +	u16 PEC_mask; /* PEC bit mask per slave address */
> +	bool PEC_use;
> +	bool read_block_use;
> +	u8 int_cnt;

What is this for? It is written to but never read.

> +	u32 clk_period_us;

Not used? Seems this struct could need some cleaning up.

> +	unsigned long int_time_stamp;
> +	unsigned long bus_freq; /* in kHz */
> +	u32 xmits;
> +#ifdef CONFIG_DEBUG_FS
> +	struct dentry *debugfs; /* debugfs device directory */
> +	u64 ber_cnt;
> +	u64 rec_succ_cnt;
> +	u64 rec_fail_cnt;
> +	u64 nack_cnt;
> +	u64 timeout_cnt;
> +#endif
> +};
> +

=2E..

> +static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
> +{
> +	if (bus->operation =3D=3D I2C_READ_OPER)
> +		return bus->rd_ind;
> +	if (bus->operation =3D=3D I2C_WRITE_OPER)
> +		return bus->wr_ind;
> +	return 0;

I2C_NO_OPER?

=2E..

> +/* recovery using bit banging functionality of the module */
> +static int npcm_i2c_recovery_init(struct i2c_adapter *_adap)
> +{
> +	struct npcm_i2c *bus =3D container_of(_adap, struct npcm_i2c, adap);
> +	struct i2c_bus_recovery_info *rinfo =3D &bus->rinfo;
> +
> +	rinfo->recover_bus =3D npcm_i2c_recovery_tgclk;
> +	rinfo->prepare_recovery =3D NULL;
> +	rinfo->unprepare_recovery =3D NULL;
> +	rinfo->set_scl =3D NULL;
> +	rinfo->set_sda =3D NULL;

'bus' is kzalloced, so no need for these NULLs.

What I wonder more, though, is if you can't populate {set|get}_{scl|sda}
and use the internal i2c_generic_scl_recovery()? Are there any issues
with it?

> +
> +	dev_dbg(bus->dev, "init i2c recovery using TGCLK\n");

There is no error path here, so I think this message is not useful.
Means also this function could be 'void'.

> +
> +	rinfo->get_scl =3D npcm_i2c_get_SCL;
> +	rinfo->get_sda =3D npcm_i2c_get_SDA;

Not needed when you have a custom function.

> +
> +	_adap->bus_recovery_info =3D rinfo;
> +
> +	return 0;
> +}
> +

=2E..

> +static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg=
 *msgs,
> +				int num)
> +{
> +	struct npcm_i2c *bus =3D container_of(adap, struct npcm_i2c, adap);
> +	struct i2c_msg *msg0, *msg1;
> +	unsigned long time_left, flags;
> +	u16 nwrite, nread;
> +	u8 *write_data, *read_data;
> +	u8 slave_addr;
> +	int timeout;
> +	int ret =3D 0;
> +	bool read_block =3D false;
> +	bool read_PEC =3D false;
> +	u8 bus_busy;
> +	unsigned long timeout_usec;
> +
> +	if (bus->state =3D=3D I2C_DISABLE) {
> +		dev_err(bus->dev, "I2C%d module is disabled", bus->num);
> +		return -EINVAL;
> +	}
> +
> +	if (num > 2 || num < 1) {
> +		dev_err(bus->dev, "I2C cmd not supported num of msgs=3D%d", num);
> +		return -EINVAL;
> +	}

Since you have an 'i2c_adapter_quirks' struct filled, the core will
I2C check that for you.

> +
> +	msg0 =3D &msgs[0];
> +	slave_addr =3D msg0->addr;
> +	if (msg0->flags & I2C_M_RD) { /* read */
> +		if (num =3D=3D 2) {
> +			dev_err(bus->dev, "num=3D2 but 1st msg rd instead of wr");
> +			return -EINVAL;

Ditto.

> +		}
> +		nwrite =3D 0;
> +		write_data =3D NULL;
> +		read_data =3D msg0->buf;
> +		if (msg0->flags & I2C_M_RECV_LEN) {
> +			nread =3D 1;
> +			read_block =3D true;
> +			if (msg0->flags & I2C_CLIENT_PEC)
> +				read_PEC =3D true;
> +		} else {
> +			nread =3D msg0->len;
> +		}
> +	} else { /* write */
> +		nwrite =3D msg0->len;
> +		write_data =3D msg0->buf;
> +		nread =3D 0;
> +		read_data =3D NULL;
> +		if (num =3D=3D 2) {
> +			msg1 =3D &msgs[1];
> +			read_data =3D msg1->buf;
> +			if (slave_addr !=3D msg1->addr) {
> +				dev_err(bus->dev,
> +					"SA=3D=3D%02x but msg1->addr=3D=3D%02x\n",
> +				       slave_addr, msg1->addr);
> +				return -EINVAL;

Ditto.

> +			}
> +			if ((msg1->flags & I2C_M_RD) =3D=3D 0) {
> +				dev_err(bus->dev,
> +					"num =3D 2 but both msg are write.\n");
> +				return -EINVAL;
> +			}

Ditto.

> +			if (msg1->flags & I2C_M_RECV_LEN) {
> +				nread =3D 1;
> +				read_block =3D true;
> +				if (msg1->flags & I2C_CLIENT_PEC)
> +					read_PEC =3D true;
> +			} else {
> +				nread =3D msg1->len;
> +				read_block =3D false;
> +			}
> +		}
> +	}
> +
> +	/* Adaptive TimeOut: astimated time in usec  + 100% margin */
> +	timeout_usec =3D (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> +	timeout =3D max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
> +	if (nwrite >=3D 32 * 1024 ||  nread >=3D 32 * 1024) {
> +		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
> +		return -EINVAL;
> +	}

Ditto.

> +
> +	time_left =3D jiffies + msecs_to_jiffies(DEFAULT_STALL_COUNT) + 1;
> +	do {
> +		/*
> +		 * we must clear slave address immediately when the bus is not
> +		 * busy, so we spinlock it, but we don't keep the lock for the
> +		 * entire while since it is too long.
> +		 */
> +		spin_lock_irqsave(&bus->lock, flags);
> +		bus_busy =3D ioread8(bus->reg + NPCM_I2CCST) & NPCM_I2CCST_BB;
> +		spin_unlock_irqrestore(&bus->lock, flags);
> +
> +	} while (time_is_after_jiffies(time_left) && bus_busy);
> +
> +	if (bus_busy) {
> +		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> +		npcm_i2c_reset(bus);
> +		i2c_recover_bus(adap);
> +		return -EAGAIN;
> +	}
> +
> +	npcm_i2c_init_params(bus);
> +	bus->dest_addr =3D slave_addr;
> +	bus->msgs =3D msgs;
> +	bus->msgs_num =3D num;
> +	bus->cmd_err =3D 0;
> +	bus->read_block_use =3D read_block;
> +
> +	reinit_completion(&bus->cmd_complete);
> +	if (!npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
> +					write_data, read_data, read_PEC,
> +					read_block))
> +		ret =3D -EBUSY;
> +
> +	if (ret !=3D -EBUSY) {
> +		time_left =3D wait_for_completion_timeout(&bus->cmd_complete,
> +							timeout);
> +
> +		if (time_left =3D=3D 0) {
> +#ifdef CONFIG_DEBUG_FS
> +			if (bus->timeout_cnt =3D=3D ULLONG_MAX) {
> +				dev_dbg(bus->dev,
> +					"timeout_cnt reach max, reset to 0");
> +				bus->timeout_cnt =3D 0;
> +			}
> +			bus->timeout_cnt++;
> +#endif
> +			if (bus->master_or_slave =3D=3D I2C_MASTER) {
> +				i2c_recover_bus(adap);
> +				bus->cmd_err =3D -EIO;
> +				bus->state =3D I2C_IDLE;
> +			}
> +		}
> +	}
> +	ret =3D bus->cmd_err;
> +
> +	/* if there was BER, check if need to recover the bus: */
> +	if (bus->cmd_err =3D=3D -EAGAIN)
> +		ret =3D i2c_recover_bus(adap);
> +
> +	return bus->cmd_err;
> +}
> +
> +static u32 npcm_i2c_functionality(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C |
> +	       I2C_FUNC_SMBUS_EMUL |
> +	       I2C_FUNC_SMBUS_BLOCK_DATA |
> +	       I2C_FUNC_SMBUS_PEC |
> +	       I2C_FUNC_SLAVE;
> +}
> +
> +static const struct i2c_adapter_quirks npcm_i2c_quirks =3D {
> +	.max_read_len =3D 32768,
> +	.max_write_len =3D 32768,

These limits are for simple reads/writes with num_msgs =3D=3D 1. If you have
limits also for num_msgs =3D=3D 2, then you also need to fill
'max_comb_1st_msg_len' and 'max_comb_2nd_msg_len'. (Because for some HW
these are different values then)

> +	.max_num_msgs =3D 2,

You can drop this because I2C_AQ_COMB_WRITE_THEN_READ implies it.

> +	.flags =3D I2C_AQ_COMB_WRITE_THEN_READ,
> +};
> +
> +static const struct i2c_algorithm npcm_i2c_algo =3D {
> +	.master_xfer =3D npcm_i2c_master_xfer,
> +	.functionality =3D npcm_i2c_functionality,
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +/* i2c debugfs directory: used to keep health monitor of i2c devices */
> +static struct dentry *npcm_i2c_debugfs_dir;
> +
> +static void i2c_init_debugfs(struct platform_device *pdev, struct npcm_i=
2c *bus)
> +{
> +	struct dentry *d;
> +
> +	if (!npcm_i2c_debugfs_dir)
> +		return;
> +
> +	d =3D debugfs_create_dir(dev_name(&pdev->dev), npcm_i2c_debugfs_dir);
> +	if (IS_ERR_OR_NULL(d))
> +		return;
> +
> +	debugfs_create_u64("ber_cnt", 0444, d, &bus->ber_cnt);
> +	debugfs_create_u64("nack_cnt", 0444, d, &bus->nack_cnt);
> +	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
> +	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
> +	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> +
> +	bus->debugfs =3D d;
> +}
> +#else
> +static void i2c_init_debugfs(struct platform_device *pdev, struct npcm_i=
2c *bus)
> +{
> +}
> +#endif
> +
> +static int  npcm_i2c_probe_bus(struct platform_device *pdev)
> +{
> +	struct npcm_i2c *bus;
> +	struct i2c_adapter *adap;
> +	struct clk *i2c_clk;
> +	static struct regmap *gcr_regmap;
> +	static struct regmap *clk_regmap;
> +	int ret;
> +	int num;
> +
> +	bus =3D devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	bus->dev =3D &pdev->dev;
> +
> +	num =3D of_alias_get_id(pdev->dev.of_node, "i2c");
> +	bus->num =3D num;

Why not assigning it directly and save the 'num' variable?

> +	/* core clk must be acquired to calculate module timing settings */
> +	i2c_clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(i2c_clk))
> +		return PTR_ERR(i2c_clk);
> +	bus->apb_clk =3D clk_get_rate(i2c_clk);
> +
> +	gcr_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr"=
);
> +	if (IS_ERR(gcr_regmap))
> +		return IS_ERR(gcr_regmap);
> +	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
> +
> +	clk_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk"=
);
> +	if (IS_ERR(clk_regmap))
> +		return IS_ERR(clk_regmap);
> +
> +	bus->reg =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(bus->reg))
> +		return PTR_ERR((bus)->reg);
> +
> +	spin_lock_init(&bus->lock);
> +	init_completion(&bus->cmd_complete);
> +
> +	adap =3D &bus->adap;
> +	adap->owner =3D THIS_MODULE;
> +	adap->class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD | I2C_CLIENT_SLAVE;

Since you have a DT compatible, you won't need classes. Just drop them.

> +	adap->retries =3D 3;
> +	adap->timeout =3D HZ;
> +	adap->algo =3D &npcm_i2c_algo;
> +	adap->quirks =3D &npcm_i2c_quirks;
> +	adap->algo_data =3D bus;
> +	adap->dev.parent =3D &pdev->dev;
> +	adap->dev.of_node =3D pdev->dev.of_node;
> +	adap->nr =3D pdev->id;
> +
> +	bus->irq =3D platform_get_irq(pdev, 0);
> +	if (bus->irq < 0)
> +		return bus->irq;
> +
> +	ret =3D devm_request_irq(bus->dev, bus->irq, npcm_i2c_bus_irq, 0,
> +			       dev_name(bus->dev), bus);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D __npcm_i2c_init(bus, pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D npcm_i2c_recovery_init(adap);
> +	if (ret)
> +		return ret;
> +
> +	i2c_set_adapdata(adap, bus);
> +
> +	snprintf(bus->adap.name, sizeof(bus->adap.name), "Nuvoton i2c");

Maybe you want to add something more specific in case you have multiple
instances of this driver at runtime.

> +	ret =3D i2c_add_numbered_adapter(&bus->adap);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to add numbered adapter %d\n", ret);

The I2C core will print warnings for you.

> +		return ret;
> +	}
> +	platform_set_drvdata(pdev, bus);
> +
> +	i2c_init_debugfs(pdev, bus);
> +	return 0;
> +}
> +
=2E..

> +#ifdef CONFIG_DEBUG_FS
> +static int __init npcm_i2c_init(void)
> +{
> +	struct dentry *dir;
> +
> +	dir =3D debugfs_create_dir("i2c", NULL);

Okay, the GPIO fault injector could also need such a directory. I will
add this to the core. And then send an incremental patch for your
driver.

> +	if (IS_ERR_OR_NULL(dir))
> +		return 0;
> +
> +	npcm_i2c_debugfs_dir =3D dir;
> +	return 0;
> +}
> +
> +static void __exit npcm_i2c_exit(void)
> +{
> +	debugfs_remove_recursive(npcm_i2c_debugfs_dir);
> +}
> +
> +module_init(npcm_i2c_init);
> +module_exit(npcm_i2c_exit);
> +#endif
> +
> +MODULE_AUTHOR("Avi Fishman <avi.fishman@gmail.com>");
> +MODULE_AUTHOR("Tali Perry <tali.perry@nuvoton.com>");
> +MODULE_AUTHOR("Tyrone Ting <kfting@nuvoton.com>");
> +MODULE_DESCRIPTION("Nuvoton I2C Bus Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_VERSION("0.1.3");
> +
> --=20
> 2.22.0
>=20

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H5ZsACgkQFA3kzBSg
KbYYzxAArYDTWVR+oZ+l1dhxJBLJLmCepSv9CsFM5joWcoJ60BB1C9CeSEMf3Krx
IJl+sEUGkfVFg1BDFfylkmDeh1V0YP5JFp1IUZzbygLhhpsj38Pvq2x/b8AoiDXo
q1csn0t1anZZRXAPsn+MDabG8gjyE4vrBneM02Qh68zlb9WSqa60Orb47vuyn0mj
6IHeqWNRRXjHeDxLkKNV+5QSDRhPT/V0ycMKQO2vUSGWPR+vMcrbPwArmKLswCIQ
9HCNnT+a5quFzwQ8YHldvIf+RSNEkfC0XMh30HYJ0C/1KIq1ncY3mEILXBKT+ON9
FjV9ctTn/3efCLb4kzLm5+aauUabyR6+4/0zTBQSUIuUbCor3a8d3UU4iVEJ8C0o
hLOLLxTgyrAsxUeG7aev9dZ82oxcV7pCAzSftZSm68rpCxdimOc6pjuo21JhSJVg
/doUgpTCwi+lZNmq96zql9Pe9Mj7fhBSslN4WRYLitX5UmleptzloDa+p/m5NGyf
FNQlihEUJOX5CST9zwfUipMjQuRF2upcfLbLTrZ5lgLa4o6+OPPtVQqxfPK/5K3B
2b+HtZvJqotnYk1TQzf1yjalxwOxYFV4syhmUtv682PVGhxfpYIloG8FZmQaaTz2
gWhbly8lQf/wrQVwk3AP1XdW2qob4fpltJhexLUVLGm6Kkbbaoc=
=ZHqW
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
